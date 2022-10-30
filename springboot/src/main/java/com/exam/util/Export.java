package com.exam.util;

import com.exam.entity.Student1;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

public class Export {
    private static final String[] Student1headers = {"学号", "姓名", "年级", "专业", "班级", "学院", "电话", "邮箱", "密码", "身份证号", "性别", "导师姓名"};
    private static final String outputDirectory = "C:\\Users\\hywo\\Desktop\\Temp\\";
    private static final String outputFileName = "Student";
    private static final String outputFileExtension = ".xlsx";
    private static final String originalFileName = outputDirectory + outputFileName + outputFileExtension;

    public void exportStudent(List<Student1> studentList) throws Exception {
        SXSSFWorkbook workbook = null;
        try {
            workbook = new SXSSFWorkbook(100);
        } catch (Exception e) {
            // e.printStackTrace();
            return;
        }
        Sheet sheet = workbook.createSheet("学生信息表");
        sheet.createRow(0);
        // 设置表头
        for (int i = 0; i < Student1headers.length; i++) {
            sheet.setColumnWidth(i, 20 * 256);
            sheet.getRow(0).createCell(i).setCellValue(Student1headers[i]);
        }
        // 设置表格内容
        for (int i = 0; i < studentList.size(); i++) {
            Student1 student1 = studentList.get(i);
            sheet.createRow(i + 1).createCell(0).setCellValue(student1.getStudentId());
            sheet.getRow(i + 1).createCell(1).setCellValue(student1.getStudentName());
            sheet.getRow(i + 1).createCell(2).setCellValue(student1.getGrade());
            sheet.getRow(i + 1).createCell(3).setCellValue(student1.getMajor());
            sheet.getRow(i + 1).createCell(4).setCellValue(student1.getClazz());
            sheet.getRow(i + 1).createCell(5).setCellValue(student1.getInstitute());
            sheet.getRow(i + 1).createCell(6).setCellValue(student1.getTel());
            sheet.getRow(i + 1).createCell(7).setCellValue(student1.getEmail());
            sheet.getRow(i + 1).createCell(8).setCellValue(student1.getPwd());
            sheet.getRow(i + 1).createCell(9).setCellValue(student1.getCardId());
            sheet.getRow(i + 1).createCell(10).setCellValue(student1.getSex());
            sheet.getRow(i + 1).createCell(11).setCellValue(student1.getTeacherName());
        }
        try {
            File file = new File(originalFileName);
            int count = 1;
            while (file.exists()) {
                file = new File(outputDirectory + outputFileName + "(" + count + ")" + outputFileExtension);
                count++;
            }
            FileOutputStream outputStream = new FileOutputStream(file);
            workbook.write(outputStream);
            outputStream.close();
            workbook.dispose();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}