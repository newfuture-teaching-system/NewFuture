package com.fontImage;
 
import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.imageio.ImageIO;


import sun.swing.SwingUtilities2;
 
public class FontImage{
 
	public void creatMyImage(String text,String content) throws IOException {

		// 整体图合成
		BufferedImage bufferedImage = new BufferedImage(1000, 1000, BufferedImage.TYPE_INT_RGB);
		// 设置图片的背景色
		Graphics2D main = bufferedImage.createGraphics();
		main.fillRect(0, 0, 1000, 1000);
		Graphics2D textG = bufferedImage.createGraphics();
		textG.setColor(new Color(37, 37, 37));
		Font hualaoContentFont = new Font("PingFang SC", Font.PLAIN, 12);
		textG.setFont(hualaoContentFont);
		textG.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_GASP);
		drawString(textG, text, 30, 800, 9000, 10, 50, true, false);

		// 存储到本地
		ImageIO.write(bufferedImage, "png", new File(content));

	}

	/**
	 *
	 * @param g
	 * @param text       文本
	 * @param lineHeight 行高（注意字体大小的控制哦）
	 * @param maxWidth   行宽
	 * @param maxLine    最大行数
	 * @param left       左边距 //整段文字的左边距
	 * @param top        上边距 //整顿文字的上边距
	 * @param trim       是否修剪文本（1、去除首尾空格，2、将多个换行符替换为一个）
	 * @param lineIndent 是否首行缩进
	 */
	public static void drawString(Graphics2D g, String text, float lineHeight, float maxWidth, int maxLine, float left,
			float top, boolean trim, boolean lineIndent) {
		if (text == null || text.length() == 0)
			return;
		if (trim) {
			text = text.replaceAll("\\n+", "\n").trim();
		}
		if (lineIndent) {
			text = "　　" + text.replaceAll("\\n", "\n　　");
		}
		drawString(g, text, lineHeight, maxWidth, maxLine, left, top);
	}

	/**
	 *
	 * @param g
	 * @param text       文本
	 * @param lineHeight 行高
	 * @param maxWidth   行宽
	 * @param maxLine    最大行数
	 * @param left       左边距
	 * @param top        上边距
	 */
	private static void drawString(Graphics2D g, String text, float lineHeight, float maxWidth, int maxLine, float left,
			float top) {
		if (text == null || text.length() == 0)
			return;

		FontMetrics fm = g.getFontMetrics();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < text.length(); i++) {
			char c = text.charAt(i);
			sb.append(c);
			int stringWidth = fm.stringWidth(sb.toString());
			if (c == '\n' || stringWidth > maxWidth) {
				if (c == '\n') {
					i += 1;
				}
				if (maxLine > 1) {
					g.drawString(text.substring(0, i), left, top);
					drawString(g, text.substring(i), lineHeight, maxWidth, maxLine - 1, left, top + lineHeight);
				} else {
					g.drawString(text.substring(0, i - 1) + "…", left, top);
				}
				return;
			}
		}
		g.drawString(text, left, top);
	}

	public static String getDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		return formatter.format(new Date());
	}

	public static String imageFullPath() {
	    String filePath = "C:/eclipse workspace/NewFuture Teaching System/WebContent/textImage/";
		String imagePath = "image" + getDate() + ".png";
		String fullPath = filePath + imagePath;
		return fullPath;
	}
 
}
