package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Supplier;

import org.springframework.stereotype.Service;

import com.example.demo.entity.Achievement;
import com.example.demo.entity.CartItem;
import com.example.demo.entity.UsersAchievement;
import com.example.demo.mapper.AchievementMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class AchievementService {
    private final AchievementMapper achievementMapper;
    private static final String CART_KEY = "cart";

    public AchievementService(AchievementMapper achievementMapper) {
        this.achievementMapper = achievementMapper;
    }

    public List<Achievement> checkAchievement(int userId, HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute(CART_KEY);

        // ログインユーザーがまだ取得していない実績情報を取得
        List<Achievement> unownedAchivements = new ArrayList<>();
        unownedAchivements = achievementMapper.selectUnownedAchievement(userId);

        // まだ獲得していない実績の取得可否を判断するためのメソッド呼び出し用mapを取得
        Map<String, Supplier<Boolean>> map = getAchievementCheckMethods(cart);

        // 新規で獲得した実績の実績名と画像をlistに格納して戻り値として返す + insert
        List<Achievement> unlockedAchievements = new ArrayList<>();
        for (Achievement unownedAchivement : unownedAchivements) {
            if (map.get(unownedAchivement.getMethodName()).get()) {
                achievementMapper.insertUsersAchievements(new UsersAchievement(userId, unownedAchivement.getId()));
                unlockedAchievements
                        .add(new Achievement(unownedAchivement.getName(), unownedAchivement.getImagePath()));
            }
        }
        return unlockedAchievements;
    }

    public Map<String, Supplier<Boolean>> getAchievementCheckMethods(List<CartItem> cart) {
        Map<String, Supplier<Boolean>> map = new HashMap<>();
        map.put("isFirstPurchase", () -> isFirstPurchase(userId));
        map.put("isRepeatCustomer5Times", () -> isRepeatCustomer5Times(userId));
        map.put("isHokkaidoMaster20Times", () -> isHokkaidoMaster20Times(userId));
        map.put("isBulkBuyer10Items", () -> isBulkBuyer10Items(cart));
        map.put("isSweetsHunter", () -> isSweetsHunter(userId));
        map.put("isSeafoodMaster", () -> isSeafoodMaster(userId));
        map.put("isFarmFriend", () -> isFarmFriend(userId));
        map.put("isOnsenLover", () -> isOnsenLover(userId));
        map.put("isHokkaidoGourmetComplete", () -> isHokkaidoGourmetComplete(userId));
        map.put("isSapporoStampCompleted", () -> isSapporoStampCompleted());
        map.put("isHakodateStampCompleted", () -> isHakodateStampCompleted());
        map.put("isFuranoStampCompleted", () -> isFuranoStampCompleted());
        map.put("isHokkaidoRoundTrip", () -> isHokkaidoRoundTrip(userId));
        map.put("isBestComboJingisukanBeer", () -> isBestComboJingisukanBeer());
        map.put("isSeafoodComboSet", () -> isSeafoodComboSet());
        map.put("isTotalSpent10000", () -> isTotalSpent10000(userId));
        map.put("isTotalSpent50000", () -> isTotalSpent50000(userId));
        map.put("isTotalSpent100000", () -> isTotalSpent100000(userId));
        map.put("isRandomAchievement", () -> isRandomAchievement());
        map.put("isRepeatCustomer5Times", () -> isRepeatCustomer5Times(userId));
        map.put("isRepeatCustomer5Times", () -> isSecretAchievement());
        return map;
    }

    // 初めてのお客様（初回購入）用メソッド
    public boolean isFirstPurchase(int userId) {
        int purchaseCount = achievementMapper.countUserPurchases(userId);
        return purchaseCount == 0;
    }

    // 常連さん（5回購入）用メソッド
    public boolean isRepeatCustomer5Times(int userId) {
        int purchaseCount = achievementMapper.countUserPurchases(userId);
        return purchaseCount == 5;
    }

    // 北海道マスター（20回購入）用メソッド
    public boolean isHokkaidoMaster20Times(int userId) {
        int purchaseCount = achievementMapper.countUserPurchases(userId);
        return purchaseCount == 20;
    }

    // 爆買い王（1回で10商品以上購入）用メソッド
    public boolean isBulkBuyer10Items(List<CartItem> cart) {
        int count = 0;
        for(CartItem cartItem : cart) {
            count += cartItem.getQuantity();
        }
        return count >= 10;
    }

    // スイーツハンター（スイーツを3種類購入）用メソッド
    public boolean isSweetsHunter(int userId) {
        int purchaseCount = achievementMapper.countUserPurchasesByCategory(userId, "スイーツ・お菓子");
        return purchaseCount >= 3;
    }

    // 海鮮マスター（海産物を3回購入）用メソッド
    public boolean isSeafoodMaster() {
        int purchaseCount = achievementMapper.countUserPurchasesByCategory(userId, "海産物");
        return purchaseCount >= 3;
    }

    // 農家さんのお友達（農作物を3回購入）用メソッド
    public boolean isFarmFriend() {
        int purchaseCount = achievementMapper.countUserPurchasesByCategory(userId, "農作物");
        return purchaseCount >= 3;
    }

    // 温泉好き（消耗品を3回購入）用メソッド
    public boolean isOnsenLover() {
        int purchaseCount = achievementMapper.countUserPurchasesByCategory(userId, "消耗品");
        return purchaseCount >= 3;
    }

    // 北海道グルメ制覇（全カテゴリから1つずつ購入）用メソッド
    public boolean isHokkaidoGourmetComplete() {
        int categoryCount = achievementMapper.countUserPurcahsesCategory(userId);
        return categoryCount == 7;
    }

    // 札幌制覇（札幌の商品を3つ購入）用メソッド
    public boolean isSapporoStampCompleted(List<CartItem> cart) {
        int userCountInArea = achievementMapper.countUserPurchasesByCategoryByArea(userId, "札幌");
        return userCountInArea >= 3;
    }

    // 函館グルメ旅（函館の商品を3つ購入）用メソッド
    public boolean isHakodateStampCompleted(List<CartItem> cart) {
        int userCountInArea = achievementMapper.countUserPurchasesByCategoryByArea(userId, "函館");
        return userCountInArea >= 3;
    }

    // 富良野マスター（富良野の商品を3つ購入）用メソッド
    public boolean isFuranoStampCompleted(List<CartItem> cart) {
        int userCountInArea = achievementMapper.countUserPurchasesByCategoryByArea(userId, "富良野");
        return userCountInArea >= 3;
    }

    // 北海道一周（3つ以上のエリアの商品を購入）用メソッド
    public boolean isHokkaidoRoundTrip(List<CartItem> cart) {
        int userCountArea = achievementMapper.countUserPurchasesByArea(userId);
        return userCountArea >= 3;
    }

    // 最強コンボ（ジンギスカン＋ビールを購入）用メソッド
    public boolean isBestComboJingisukanBeer(List<CartItem> cart) {
        if(cart != null) {
            boolean hasJingisukan = false;
            boolean hasBeer = false;
            for(CartItem cartItem : cart) {
                if(cartItem.getProductName().contains("ジンギスカン")) {
                    hasJingisukan = true;
                }
                if(cartItem.getProductName().contains("ビール")) {
                    hasBeer = true;
                }
            }
            return hasJingisukan && hasBeer;
        }
        return false;
    }

    // 海の幸セット（カニ＋イクラ＋ホタテを購入）用メソッド
    public boolean isSeafoodComboSet(List<CartItem> cart) {
        if(cart != null) {
            boolean hasKani = false;
            boolean hasIkura = false;
            boolean hasHotate = false;
            for(CartItem cartItem : cart) {
                if(cartItem.getProductName().contains("カニ") || cartItem.getProductName().contains("蟹") || cartItem.getProductName().contains("ガニ")　|| cartItem.getProductName().contains("かに")　|| cartItem.getProductName().contains("がに")) {
                    hasKani = true;
                }
                if(cartItem.getProductName().contains("イクラ") || cartItem.getProductName().contains("いくら")) {
                    hasIkura = true;
                }
                if(cartItem.getProductName().contains("ホタテ") || cartItem.getProductName().contains("ほたて") || cartItem.getProductName().contains("帆立")) {
                    hasHotate = true;
                }
            }
            return hasKani && hasIkura && hasHotate;
        }
        return false;
    }

    // 北海道に貢献（累計1万円購入）用メソッド
    public boolean isTotalSpent10000() {
        int totalAmount = achievementMapper.countUserPurchasesAmount(userId);
        return totalAmount >= 10000;
    }

    // 大富豪（累計5万円購入）用メソッド
    public boolean isTotalSpent50000() {
        int totalAmount = achievementMapper.countUserPurchasesAmount(userId);
        return totalAmount >= 50000;
    }

    // 伝説の支援者（累計10万円購入）用メソッド
    public boolean isTotalSpent100000() {
        int totalAmount = achievementMapper.countUserPurchasesAmount(userId);
        return totalAmount >= 100000;
    }

    // 奇跡の組み合わせ（特定の珍しい組み合わせで達成）用メソッド
    public boolean isMiracleCombination() {
        return true;
    }

    // ランダム達成（非公開条件で達成）用メソッド
    public boolean isRandomAchievement() {
        return true;
    }

    // シークレット実績（条件非公開・？？？表示）用メソッド
    public boolean isSecretAchievement() {
        return true;
    }
}
 