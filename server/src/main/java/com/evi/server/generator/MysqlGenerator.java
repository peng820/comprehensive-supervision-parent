package com.evi.server.generator;


import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

/**
 * 自动生成代码工具类
 * @author Lenovo
 */
public class MysqlGenerator {
    public static void main(String[] args) {

        FastAutoGenerator.create("jdbc:mysql://127.0.0.1:3306/shiro?characterEncoding=utf-8",
                "root","root")
                .globalConfig(builder -> {
                    builder.author("Lenovo").fileOverride().outputDir("E:\\work\\SeaArea\\sourcecode\\comprehensive-supervision-parent\\src\\main\\java");
                })
                .packageConfig(builder -> {
                    builder.parent("com.evi.server").pathInfo(Collections.singletonMap(OutputFile.mapperXml,
                            "E:\\work\\SeaArea\\sourcecode\\comprehensive-supervision\\src\\main\\java\\com\\evi\\server\\mapper"));
                })
                .strategyConfig(builder -> {
                    builder.addInclude("sys_dept","sys_log","sys_menu","sys_role","sys_role_menu","sys_route_conf","sys_user","sys_user_role");

                })
                .templateEngine(new FreemarkerTemplateEngine())
                .execute();
    }
}
