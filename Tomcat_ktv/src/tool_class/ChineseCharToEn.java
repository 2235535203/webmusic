package tool_class;

import java.io.UnsupportedEncodingException;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;


/**
 * 取得给定汉字串的首字母串,即声母串
 * Title: ChineseCharToEn
 * @date 2004-02-19 注：只支持GB2312字符集中的汉字
 */
public final class ChineseCharToEn {
	public static String getPingYin(String src) {
	    HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
	    format.setCaseType(HanyuPinyinCaseType.LOWERCASE);
	    format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
	    format.setVCharType(HanyuPinyinVCharType.WITH_V);
	    StringBuilder sb = new StringBuilder();
	    char[] srcArray = src.toCharArray();
	    try {
	        for (int i = 0; i < srcArray.length; i++) {
	            // 判断是否为汉字字符
	            if (java.lang.Character.toString(srcArray[i]).matches("[\\u4E00-\\u9FA5]+")) {
	                String[] targetArray = PinyinHelper.toHanyuPinyinStringArray(srcArray[i], format);
	                sb.append(targetArray[0]);
	            } else {
	                sb.append(java.lang.Character.toString(srcArray[i]));
	            }
	        }
	        return sb.toString();
	    } catch (BadHanyuPinyinOutputFormatCombination e1) {
	        e1.printStackTrace();
	    }
	    return sb.toString();
	}
	/**
	 * 得到中文首字母,例如"专科"得到zk返回
	 * @param str 中文字符串
	 * @return
	 */
	public static String getPinYinHeadChar(String str) {
	    StringBuilder sb = new StringBuilder();
	    for (int i = 0; i < str.length(); i++) {
	        char word = str.charAt(i);
	        String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
	        if (pinyinArray != null) {
	            sb.append(pinyinArray[0].charAt(0));
	        } else {
	            sb.append(word);
	        }
	    }
	    return sb.toString();
	}
	/**
	 * 将字符串转移为ASCII码
	 * @param cnStr  中文字符串
	 * @return
	 */
	public static String getCnASCII(String cnStr) {
	    StringBuilder sb = new StringBuilder();
	    byte[] bGBK = cnStr.getBytes();
	    for (int i = 0; i < bGBK.length; i++) {
	        sb.append(Integer.toHexString(bGBK[i] & 0xff));
	    }
	    return sb.toString();
	}


}
