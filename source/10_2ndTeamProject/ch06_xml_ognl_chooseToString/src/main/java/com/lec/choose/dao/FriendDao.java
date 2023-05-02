package com.lec.choose.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.choose.vo.Friend;

@Mapper
public interface FriendDao {
	public int joinFriend(Friend friend);
	public List<Friend> listFriend();
	public int getNo();
}
