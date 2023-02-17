package com.chenxurui.web.admin;

import com.chenxurui.pojo.Blog;
import com.chenxurui.pojo.Type;
import com.chenxurui.service.TypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class TypeController {

    @Autowired
    private TypeService typeService;

    //获取分页后的分类
    @GetMapping("/types")
    public String types(@RequestParam(value = "pageNum", defaultValue = "1", required = false) Integer pageNum, Model model) {
        PageHelper.startPage(pageNum, 5);
        List<Type> types = typeService.getAllType();
        PageInfo pageInfo = new PageInfo<>(types);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/types";
    }

    //跳转到新增页面
    @GetMapping("types/input")
    public String input(Model model) {
        model.addAttribute("type", new Type());
        return "admin/types-input";
    }

    //新增分类操作
    @PostMapping("/types")
    public String post(Type type, RedirectAttributes attributes) {
        //通过类名获取分类
        String name = type.getName();
        Type t = typeService.getTypeByName(name);
        //判断分类是否存在
        if (t == null) {
            typeService.saveType(type);
            attributes.addFlashAttribute("message", "新增成功");
        } else {
            attributes.addFlashAttribute("message", "新增失败");
        }
        return "redirect:/admin/types";
    }

    //跳转到编辑页面,并将要修改的数据回显
    @GetMapping("/types/{id}/input")
    public String editInput(@PathVariable("id") Long id, Model model) {
        //首先通过编号获取到分类
        Type type = typeService.getTypeById(id);

        //回显数据
        model.addAttribute("type", type);
        return "admin/types-input";
    }

    //编辑分类
    @PostMapping("/types/{id}")
    public String editPost(Type type, RedirectAttributes attributes) {
        //通过类名获取分类
        String name = type.getName();
        Type t = typeService.getTypeByName(name);
        //判断分类是否存在
        if (t == null) {
            typeService.updateType(type);
            attributes.addFlashAttribute("message", "更新成功");
        } else {
            attributes.addFlashAttribute("message", "更新失败，分类名重复");
        }
        return "redirect:/admin/types";
    }

    //删除分类
    @GetMapping("/types/{id}/delete")
    public String delete(@PathVariable("id") Long id, RedirectAttributes attributes) {
        typeService.deleteType(id);
        attributes.addFlashAttribute("message", "删除成功");
        return "redirect:/admin/types";
    }
}
