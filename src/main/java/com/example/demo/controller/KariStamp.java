//package com.example.demo.controller;
//
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//@Controller
//public class KariStamp {
//
//    @GetMapping("/stamp")
//    public String stamp(Model model) {
//
//        List<Map<String, Object>> stamps = List.of(
//            Map.of("name", "札幌", "image_path", "/images/stamp_image/Sapporo_01.svg.png", "is_acquired", true, "unlocked_at", "2026-05-01"),
//            Map.of("name", "函館", "image_path", "/images/stamp_image/Hakodate_05.svg.png", "is_acquired", false, "unlocked_at", "2"),
//            Map.of("name", "旭川", "image_path", "/images/stamp_image/Asahikawa_07.svg.png", "is_acquired", true, "unlocked_at", "2026-05-10"),
//            Map.of("name", "室蘭", "image_path", "/images/stamp_image/Muroran_02.svg.png", "is_acquired", true, "unlocked_at", "2026-05-01"),
//            Map.of("name", "帯広", "image_path", "/images/stamp_image/Obihiro_03.svg.png", "is_acquired", false, "unlocked_at", "2"),
//            Map.of("name", "富良野", "image_path", "/images/stamp_image/Furano_09.svg.png", "is_acquired", true, "unlocked_at", "2026-05-10")
//        );
//
//        model.addAttribute("stamps", stamps);
//        model.addAttribute("acquiredCount", 2);
//        model.addAttribute("totalCount", 3);
//
//        return "stamp/stamp";
//    }
//}