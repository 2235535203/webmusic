package tool_class;

import java.io.UnsupportedEncodingException;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;


/**
 * ȡ�ø������ִ�������ĸ��,����ĸ��
 * Title: ChineseCharToEn
 * @date 2004-02-19 ע��ֻ֧��GB2312�ַ����еĺ���
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
	            // �ж��Ƿ�Ϊ�����ַ�
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
	 * �õ���������ĸ,����"ר��"�õ�zk����
	 * @param str �����ַ���
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
	 * ���ַ���ת��ΪASCII��
	 * @param cnStr  �����ַ���
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
