package cn.slkj.cdtaxt;

import java.math.BigInteger;

import cn.slkj.cdtaxt.util.Tools;
import cn.slkj.slUtil.RightsHelper;

public class Test {
	static String menuIds ="1,2,5,16,19,21,45,46,47,48,51,52,22,36,37,39,40,43,44,50,54,25,26,27,41,23,24,28,29,30,35,38,42,49,53,31,32,33,34";
	
	public static void main(String[] args) {
//		String[] rights = Tools.str2StrArray(menuIds);
//		for(int i=0; i<rights.length; i++){
//			System.out.println((rights[i]));
//		}
		
		BigInteger rights1 = RightsHelper.sumRights(Tools.str2StrArray(menuIds));
		System.out.println(rights1);
		
//		BigInteger rights;
		System.out.println(RightsHelper.testRights(rights1  , 8));
	}
}
