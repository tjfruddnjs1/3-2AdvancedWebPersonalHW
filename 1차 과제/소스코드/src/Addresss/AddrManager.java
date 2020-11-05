package Addresss;

import java.util.ArrayList;
import java.util.List;

public class AddrManager {
List<AddrBean> addrlist = new ArrayList<AddrBean>();
	
	// 주소록 추가 메서드
	public void add(AddrBean ab) {
		addrlist.add(ab);
	}
	
	// 주소록 목록 전달 메서드
	public List<AddrBean> getAddrList() {
		return addrlist;
	}
	
	// 특정 사용자를 주소록 목록에서 검색하는 메서드
	public AddrBean getAddr(String username) {
		for(AddrBean ab : addrlist) {
			if(ab.getUsername().equals(username))
				return ab;
		}
		return null;
	}
	// 특정 사용자를 주소록 목록에서 삭제하는 메서드
	public void deleteAddr(String username) {
		for(AddrBean ab : addrlist) {
			if(ab.getUsername().equals(username)) addrlist.remove(ab); 
		}
	}
}
