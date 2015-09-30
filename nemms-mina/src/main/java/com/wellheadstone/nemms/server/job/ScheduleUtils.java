package com.wellheadstone.nemms.server.job;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.wellheadstone.nemms.server.domain.po.DeviceSchedulePo;

public class ScheduleUtils {
	public static boolean isRunnable(DeviceSchedulePo po) throws ParseException {
		int interval = po.getInterval();
		Calendar c = Calendar.getInstance();
		long curmill = c.getTimeInMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		Date time = sdf.parse(po.getStartTime());
		Calendar ctime = Calendar.getInstance();
		ctime.setTime(time);

		int hour = ctime.get(Calendar.HOUR_OF_DAY);
		int minutes = ctime.get(Calendar.MINUTE);
		int seconds = ctime.get(Calendar.SECOND);

		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		String curtime = dateFormat.format(c.getTime());
		String timeStr = dateFormat.format(time);

		if (po.getPeroid().equals("y")) {
			int curyear = c.get(Calendar.YEAR);
			c.set(curyear, 1 - 1, 1, hour, minutes, seconds);
			c.add(Calendar.DATE, interval);
			long mill = c.getTimeInMillis();
			return mill == curmill ? true : false;
		}

		if (po.getPeroid().equals("M")) {
			int curmounth = c.get(Calendar.MONTH);
			c.set(curmounth, interval - 1, 1, hour, minutes, seconds);
			long mill = c.getTimeInMillis();
			return mill == curmill ? true : false;
		}

		if (po.getPeroid().equals("w")) {
			int curweek = c.get(Calendar.DAY_OF_WEEK);
			return curweek - 1 == interval && c.get(Calendar.HOUR_OF_DAY) == hour && c.get(Calendar.MINUTE) == minutes
					&& c.get(Calendar.SECOND) == seconds ? true : false;
		}

		if (po.getPeroid().equals("d")) {
			return c.get(Calendar.DATE) % interval == 0 && timeStr.equals(curtime) ? true : false;
		}

		if (po.getPeroid().equals("h")) {
			return c.get(Calendar.HOUR) % interval == 0 && c.get(Calendar.MINUTE) == minutes
					&& c.get(Calendar.SECOND) == seconds ? true : false;
		}

		if (po.getPeroid().equals("m")) {
			return c.get(Calendar.MINUTE) % interval == 0 && c.get(Calendar.SECOND) == 0 ? true : false;
		}

		if (po.getPeroid().equals("s")) {
			return c.get(Calendar.SECOND) % interval == 0 ? true : false;
		}
		return false;

	}
}
