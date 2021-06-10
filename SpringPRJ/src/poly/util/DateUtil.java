package poly.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

public static String getDateTime (String fm) {
		
		Date toDay = new Date();
		
		SimpleDateFormat date = new SimpleDateFormat(fm);
		
		return date.format(toDay);
	}
	
	public static String getDateTime() {
	
		
		return getDateTime("yyyy.MM.dd");
	}
	
public static String getTime (String fm) {
		
		Date toDay = new Date();
		
		SimpleDateFormat date = new SimpleDateFormat(fm);
		
		return date.format(toDay);
	}
	
	public static String getTime() {
	
		return getDateTime("HH:mm:ss");
	}
	
}
