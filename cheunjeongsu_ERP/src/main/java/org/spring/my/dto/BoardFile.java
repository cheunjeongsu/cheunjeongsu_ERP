package org.spring.my.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFile {
	private int fnum;
	private int bnum;
	private String filename;
	private Date regdate;
}
