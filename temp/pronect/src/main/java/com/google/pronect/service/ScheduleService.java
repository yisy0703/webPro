package com.google.pronect.service;

import java.util.List;

import com.google.pronect.vo.Schedule;
import com.google.pronect.vo.Group;

public interface ScheduleService {
	public void insertSchedule(Schedule schedule, Group study, int gid);
	public List<Schedule> totalSchedule(int gid);
	public Schedule detailSchedule(int scd_id);
}
