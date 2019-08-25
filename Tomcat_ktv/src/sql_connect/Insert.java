package sql_connect;

import java.sql.*;

import javafx.scene.chart.PieChart.Data;
import sql_connect.DatabaseUtil;
import tool_class.ChineseCharToEn;


public class Insert {
	/**
	 * 向数据库中插入新的歌曲
	 * @return 200成功
	 * @return 400失败
	 */
	public static int  addmusic(String music_name,String singer_name,String lyricist,String arrangenment,String remark,String video_location,String audio_location,String accmopany_location) throws SQLException {
		//先检查唱这首歌的歌手是不是已经在creator表里了，如果不在就新建一个
		String querysinger="select c_id from creator where name='"+singer_name+"';";
		ResultSet singer=DatabaseUtil.query(querysinger);
		int worker_id=0;
		int lyricist_id=0;
		int arrangement_id=0;
		String firstchar_music=ChineseCharToEn.getPinYinHeadChar(music_name);;
		String firstchar_singer=ChineseCharToEn.getPinYinHeadChar(singer_name);
		if(singer.next()==false) {
			//没找到
			//再找一下在worker表里面有没有这个人
			String queryworker="select worker_id from worker where name='"+singer_name+"';";
			ResultSet resqueryworker=DatabaseUtil.query(queryworker);
			System.out.println("在worker表中查找该歌手");
			if(resqueryworker.next()==false) {
				//说明这个人无论是在哪个表里都不存在，在worker表里和creator表里面都要新建一个
				//先向worker表里面插入
				System.out.println("在worker表中不存在");
				String insertworker="insert into worker (name) values ('"+singer_name+"');";
				int resinsertworker=DatabaseUtil.update(insertworker);
				if(resinsertworker==1) {
					//插入成功，要获取插入的worker_id
					System.out.println("插入成功，要获取插入的worker_id");
					String queryworkerid="select worker_id from worker where name='"+singer_name+"';";
					ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
					if(resworkerid.next()==false) {
					//插入失败
						for(int i=0;i<3;i++) {
							resworkerid=DatabaseUtil.query(queryworkerid);
							if (resworkerid.next()) {
								resworkerid.next();
								worker_id=Integer.parseInt(resworkerid.getString(1));
								System.out.println(worker_id);
								break;
								
							}
							
							else {
								if(i==2) {
									return 400;
								}
							}
						}
					}
					else {
						//成功插入并获取到worker_id
						//resworkerid.next();
						worker_id=Integer.parseInt(resworkerid.getString(1));
						System.out.println(worker_id);
					}
				}
				
				else {
					//插入worker失败
					for(int i=0;i<3;i++) {
						resinsertworker=DatabaseUtil.update(insertworker);
						if (resinsertworker==1) {  
							//插入成功，要获取插入的worker_id
							String queryworkerid="select worker_id from worker where name='"+singer_name+"';";
							ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
							if(resworkerid.next()==false) {
								for(int j=0;j<3;j++) {
									resworkerid=DatabaseUtil.query(queryworkerid);
									if (resworkerid.next()) {
										//得到了worker——id
										//resworkerid.next();
										worker_id=Integer.parseInt(resworkerid.getString(1));
										System.out.println(worker_id);
										break;
									}
									else {
										if(j==2) {
											return 400;
										}
									}
								}
							}
							else {
								//成功插入并获取到worker_id
								//resworkerid.next();
								worker_id=Integer.parseInt(resworkerid.getString(1));
								System.out.println(worker_id);
							}
							break;
							}
						
						else {
							if(i==2) {
								return 400;
							}
						}
					}
					
					//在creator表中根据得到的worker_id插入歌手的id和姓名以及首字母
				String insert_singer="insert into creator(c_id,name,firstchar) values ('"+worker_id+"','"+singer_name+"','"+firstchar_singer+"');";
				int resinsertsinger=DatabaseUtil.update(insert_singer);
				if(resinsertsinger!=1) {
					//插入失败
					for(int i=0;i<3;i++) {
						//尝试插入三次直到成功
						resinsertsinger=DatabaseUtil.update(insert_singer);
						if(resinsertsinger==1) {
							break;
						}
						else {
							if(i==2)
								//重复两次但还没有插入成功，则返回本次操作失败
								return 400;
						}
					}
				}
			}
			}
		else {
			//说明虽然在歌手表里面没有，但是他的身份是作词或作曲
			//通过worker表获取他的id，再在creator表中新建一个他的歌手信息
			String queryworkerid="select worker_id from worker where name='"+singer_name+"';";
			ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
			if(resworkerid.next()==false) {
				for(int i=0;i<3;i++) {
					resworkerid=DatabaseUtil.query(queryworkerid);
					if (resworkerid.next()) {
						//得到了worker——id
						//resworkerid.next();
						worker_id=Integer.parseInt(resworkerid.getString(1));
						System.out.println(worker_id);
						break;
					}
					else {
						if(i==2) {
							return 400;
						}
					}
				}
			}
			else {
				//成功获取到worker_id
				//resworkerid.next();
				worker_id=Integer.parseInt(resworkerid.getString(1));
				System.out.println(worker_id);
			}
	
	//在creator表中根据得到的worker_id插入歌手的id和姓名
			String insert_singer="insert into creator(c_id,name,firstchar) values ('"+worker_id+"','"+singer_name+"','"+firstchar_singer+"');";
   int resinsertsinger=DatabaseUtil.update(insert_singer);
if(resinsertsinger!=1) {
	//插入失败
	for(int i=0;i<3;i++) {
		//尝试插入三次直到成功
		resinsertsinger=DatabaseUtil.update(insert_singer);
		if(resinsertsinger==1) {
			break;
		}
		else {
			if(i==2)
				//重复两次但还没有插入成功，则返回本次操作失败
				return 400;
		}
	}
}
}
		}
		else {
			//直接在creator表里面找到了那个歌手
			//singer.next();
			worker_id=Integer.parseInt(singer.getString(1));
			System.out.println(worker_id);
			
		}
			
			
        //至此歌手的插入与查询解决了，然后该解决作词与作曲的问题
		
		
		
		//进行作词的插入与查询
		String querylyricist="select music_workerID from music_worker where music_workerName='"+lyricist+"' and position='作词';";
		ResultSet resquerylyricist=DatabaseUtil.query(querylyricist);
		if(resquerylyricist.next()==false) {
			//没找到
			//再找一下在worker表里面有没有这个人
			System.out.println("作词表中没找到，在worker表中找");
			String queryworker="select worker_id from worker where name='"+lyricist+"';";
			ResultSet resqueryworker=DatabaseUtil.query(queryworker);
			if(resqueryworker.next()==false) {
				//说明这个人无论是在哪个表里都不存在，在worker表里和music_worker表里面都要新建一个
				//先向worker表里面插入
				String insertworker="insert into worker (name) values ('"+lyricist+"');";
				int resinsertworker=DatabaseUtil.update(insertworker);
				if(resinsertworker==1) {
					//插入成功，要获取插入的worker_id
					String queryworkerid="select worker_id from worker where name='"+lyricist+"';";
					ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
					if(resworkerid.next()==false) {
					//插入失败
						for(int i=0;i<3;i++) {
							resworkerid=DatabaseUtil.query(queryworkerid);
							if (resworkerid.next()) {
								//resworkerid.next();
								lyricist_id=Integer.parseInt(resworkerid.getString(1));
								System.out.println(lyricist_id);
								break;
								
							}
							
							else {
								if(i==2) {
									return 400;
								}
							}
						}
					}
					else {
						//成功插入并获取到worker_id
						//resworkerid.next();
						lyricist_id=Integer.parseInt(resworkerid.getString(1));
						System.out.println(lyricist_id);
					}
				}
				
				else {
					//插入worker失败
					for(int i=0;i<3;i++) {
						resinsertworker=DatabaseUtil.update(insertworker);
						if (resinsertworker==1) {  
							//插入成功，要获取插入的worker_id
							String queryworkerid="select worker_id from worker where name='"+lyricist+"';";
							ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
							if(resworkerid.next()==false) {
								for(int j=0;j<3;j++) {
									resworkerid=DatabaseUtil.query(queryworkerid);
									if (resworkerid.next()) {
										//得到了lyricist——id
										//resworkerid.next();
										lyricist_id=Integer.parseInt(resworkerid.getString(1));
										System.out.println(lyricist_id);
										break;
									}
									else {
										if(j==2) {
											return 400;
										}
									}
								}
							}
							else {
								//成功插入并获取到lyricist_id
								//resworkerid.next();
								lyricist_id=Integer.parseInt(resworkerid.getString(1));
								System.out.println(lyricist_id);
							}
							break;
							}
						
						else {
							if(i==2) {
								return 400;
							}
						}
					}
					
					//在music_worker表中根据得到的lyricist_id插入作词的id和姓名
				String insert_lyricist="insert into music_worker(music_workerID,music_workerName,position) values ('"+lyricist_id+"','"+lyricist+"','作词');";
				int resinsertlyricist=DatabaseUtil.update(insert_lyricist);
				if(resinsertlyricist!=1) {
					//插入失败
					for(int i=0;i<3;i++) {
						//尝试插入三次直到成功
						resinsertlyricist=DatabaseUtil.update(insert_lyricist);
						if(resinsertlyricist==1) {
							break;
						}
						else {
							if(i==2)
								//重复两次但还没有插入成功，则返回本次操作失败
								return 400;
						}
					}
				}
			}
			}
		else {
			//说明虽然在作词表里面没有，但是他的身份是作曲或歌手
			//通过worker表获取他的id，再在creator表中新建一个他的歌手信息
			String querylyricistid="select worker_id from worker where name='"+lyricist+"';";
			ResultSet reslyricistid=DatabaseUtil.query(querylyricistid);
			if(reslyricistid.next()==false) {
				//没有找到workerid
				for(int i=0;i<3;i++) {
					reslyricistid=DatabaseUtil.query(querylyricistid);
					if (reslyricistid.next()) {
						//得到了worker——id
						//reslyricistid.next();
						lyricist_id=Integer.parseInt(reslyricistid.getString(1));
						System.out.println(lyricist_id);
						break;
					}
					else {
						if(i==2) {
							return 400;
						}
					}
				}
			}
			else {
				//成功获取到worker_id
				//reslyricistid.next();
				lyricist_id=Integer.parseInt(reslyricistid.getString(1));
				System.out.println(lyricist_id);
			}
			//在music_worker表中根据得到的lyricist_id插入作词的id和姓名
			String insert_lyricist="insert into music_worker(music_workerID,music_workerName,position) values ('"+lyricist_id+"','"+lyricist+"','作词');";
			int resinsertlyricist=DatabaseUtil.update(insert_lyricist);
			if(resinsertlyricist!=1) {
				//插入失败
				for(int i=0;i<3;i++) {
					//尝试插入三次直到成功
					resinsertlyricist=DatabaseUtil.update(insert_lyricist);
					if(resinsertlyricist==1) {
						break;
					}
					else {
						if(i==2)
							//重复两次但还没有插入成功，则返回本次操作失败
							return 400;
					}
				}
			}
}
		}
		else {
			//直接在creator表里面找到了那个歌手
			//resquerylyricist.next();
			lyricist_id=Integer.parseInt(resquerylyricist.getString(1));
			
		}
		
		
		 //至此歌手和作词的插入与查询解决了，然后该解决作曲的问题
		
		
		//进行作词的插入与查询
		String queryarrangement="select music_workerID from music_worker where music_workerName='"+arrangenment+"' and position='作曲';";
		ResultSet resqueryarrangement=DatabaseUtil.query(queryarrangement);
		if(resqueryarrangement.next()==false) {
			//没找到
			//再找一下在worker表里面有没有这个人
			String queryworker="select worker_id from worker where name='"+arrangenment+"';";
			ResultSet resqueryworker=DatabaseUtil.query(queryworker);
			if(resqueryworker.next()==false) {
				//说明这个人无论是在哪个表里都不存在，在worker表里和music_worker表里面都要新建一个
				//先向worker表里面插入
				String insertworker="insert into worker (name) values ('"+arrangenment+"');";
				int resinsertworker=DatabaseUtil.update(insertworker);
				if(resinsertworker==1) {
					//插入成功，要获取插入的worker_id
					String queryworkerid="select worker_id from worker where name='"+arrangenment+"';";
					ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
					if(resworkerid.next()==false) {
					//查询失败
						for(int i=0;i<3;i++) {
							resworkerid=DatabaseUtil.query(queryworkerid);
							if (resworkerid.next()) {
								//resworkerid.next();
								arrangement_id=Integer.parseInt(resworkerid.getString(1));
								System.out.println(arrangement_id);
								break;
								
							}
							
							else {
								if(i==2) {
									return 400;
								}
							}
						}
					}
					else {
						//成功插入并获取到worker_id
						//resworkerid.next();
						arrangement_id=Integer.parseInt(resworkerid.getString(1));
						System.out.println(arrangement_id);
					}
				}
				
				else {
					//插入worker失败
					for(int i=0;i<3;i++) {
						resinsertworker=DatabaseUtil.update(insertworker);
						if (resinsertworker==1) {  
							//插入成功，要获取插入的worker_id
							String queryworkerid="select worker_id from worker where name='"+arrangenment+"';";
							ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
							if(resworkerid.next()==false) {
								for(int j=0;j<3;j++) {
									resworkerid=DatabaseUtil.query(queryworkerid);
									if (resworkerid.next()) {
										//得到了arrangement——id
										//resworkerid.next();
										arrangement_id=Integer.parseInt(resworkerid.getString(1));
										System.out.println(arrangement_id);
										break;
									}
									else {
										if(j==2) {
											return 400;
										}
									}
								}
							}
							else {
								//成功插入并获取到lyricist_id
								//resworkerid.next();
								arrangement_id=Integer.parseInt(resworkerid.getString(1));
								System.out.println(arrangement_id);
							}
							break;
							}
						
						else {
							if(i==2) {
								return 400;
							}
						}
					}
					
					//在music_worker表中根据得到的arrangemnt_id插入作词的id和姓名
				String insert_arrangement="insert into music_worker(music_workerID,music_workerName,position) values ('"+arrangement_id+"','"+arrangenment+"','作曲');";
				int resinsertarrangement=DatabaseUtil.update(insert_arrangement);
				if(resinsertarrangement!=1) {
					//插入失败
					for(int i=0;i<3;i++) {
						//尝试插入三次直到成功
						resinsertarrangement=DatabaseUtil.update(insert_arrangement);
						if(resinsertarrangement==1) {
							break;
						}
						else {
							if(i==2)
								//重复两次但还没有插入成功，则返回本次操作失败
								return 400;
						}
					}
				}
			}
			}
		else {
			//说明虽然在作曲表里面没有，但是他的身份是作词或歌手
			//通过worker表获取他的id，再在music_worker表中新建一个他的歌手信息
			String queryarrangementid="select worker_id from worker where name='"+arrangenment+"';";
			ResultSet resarrangementid=DatabaseUtil.query(queryarrangementid);
			if(resarrangementid.next()==false) {
				for(int i=0;i<3;i++) {
					resarrangementid=DatabaseUtil.query(queryarrangementid);
					if (resarrangementid.next()) {
						//得到了worker——id
						//resarrangementid.next();
						arrangement_id=Integer.parseInt(resarrangementid.getString(1));
						System.out.println(arrangement_id);
						break;
					}
					else {
						if(i==2) {
							return 400;
						}
					}
				}
			}
			else {
				//成功获取到worker_id
				//resarrangementid.next();
				arrangement_id=Integer.parseInt(resarrangementid.getString(1));
				System.out.println(arrangement_id);
			}
			//在music_worker表中根据得到的arrangement_id插入作词的id和姓名
			String insert_arrangement="insert into music_worker(music_workerID,music_workerName,position) values ('"+arrangement_id+"','"+arrangenment+"','作曲');";
			int resinsertarrangement=DatabaseUtil.update(insert_arrangement);
			if(resinsertarrangement!=1) {
				//插入失败
				for(int i=0;i<3;i++) {
					//尝试插入三次直到成功
					resinsertarrangement=DatabaseUtil.update(insert_arrangement);
					if(resinsertarrangement==1) {
						break;
					}
					else {
						if(i==2)
							//重复两次但还没有插入成功，则返回本次操作失败
							return 400;
					}
				}
			}
}
		}
		else {
			//直接在creator表里面找到了那个歌手
			//resqueryarrangement.next();
			arrangement_id=Integer.parseInt(resqueryarrangement.getString(1));

		}
		
		
		//歌手，作词，作曲全都搞定，接下来要正式向数据库中插入与music有关的信息了
		//确定歌手与music的首字母，调用ChineseCharToEn.java
	    ResultSet strmid=DatabaseUtil.query("select max(m_id) from musicmessage;");
	    strmid.next();
		String stringm_id=strmid.getString(1);
		int m_id=0,newm_id=0;
		try {
		     m_id = Integer.parseInt(stringm_id);
		} catch (NumberFormatException e) {
		    e.printStackTrace();
		}
		DatabaseUtil.update("insert into musicmessage (m_name,remark,firstchar) values ('"+music_name+"','"+remark+"','"+firstchar_music+"');");
		ResultSet newstrmid=DatabaseUtil.query("select max(m_id) from musicmessage;");
		newstrmid.next();
		String stringnewm_id=newstrmid.getString(1);
		try {
		    newm_id = Integer.parseInt(stringnewm_id);
		} catch (NumberFormatException e) {
		    e.printStackTrace();
		}
		if(newm_id==m_id+1) {
			//插入成功，由于musicmessage中m_id自增，所以newm_id就是新插入的music的m_id
		}
		else {
			return 400;
		}
		DatabaseUtil.update("insert into accompany (m_id,location) values ("+newm_id+",'"+accmopany_location+"');");
		DatabaseUtil.update("insert into audio (m_id,location) values ("+newm_id+",'"+audio_location+"');");
		DatabaseUtil.update("insert into video (m_id,location) values ("+newm_id+",'"+video_location+"');");
		DatabaseUtil.update("insert into creatormakemusic (m_id,c_id,arrangement_id,lyricist_id) values ("+newm_id+","+worker_id+","+arrangement_id+","+lyricist_id+");");
		DatabaseUtil.update("insert into musicinalbum(m_id,alb_id) values ("+newm_id+",1);");
		
		
		return 200;
	}
	
	/**
	 * 向数据库中插入新的歌手
	 * @return 200成功
	 * @return 300插入的歌手已存在
	 * @return 400失败
	 * @throws SQLException 
	 * 
	 */
	public static int addsinger(String singer_name,String gender,String country,String area,String remark,String picture_location) throws SQLException {
		String firstchar_singer=ChineseCharToEn.getPinYinHeadChar(singer_name);
		int singer_id=0;
		int picture_id=0;
		//先查询在worker中有没有这位歌手
		ResultSet ressinger=DatabaseUtil.query("select worker_id from worker where name='"+singer_name+"';");
		if(ressinger.next()) {
			//在worker中查到了这位歌手的信息
			//先获得这个worker的workerid
			//在creator表中再进行查询，如果存在，则返回300
			singer_id = Integer.parseInt(ressinger.getString(1));
			ResultSet rescreator=DatabaseUtil.query("select c_id from creator where c_id="+singer_id+");");
			if(rescreator.next()) {
				//说明这个歌手在creator表里面已经存在了，所以返回300
			    return 300;
			}
			else {
				//说明这个歌手虽然在worker表里面有，但是是作词或者作曲的身份，应该在creator表里面为他新建一条记录
				//由于creator表里面有cover，所以先把照片插入到picture里面去并且搞到pic_id
				int resinsertpicture=DatabaseUtil.update("insert into picture(location) values ('"+picture_location+"');");
				if(resinsertpicture==1) {
					//插入照片成功
					ResultSet respicture=DatabaseUtil.query("select max(pic_id) from picture;");
					//获得照片的id
					if(respicture.next()) {
						picture_id=Integer.parseInt(respicture.getString(1));
						//成功得到照片的id
					}
					else {
						//获取照片id的行为失败
						return 400;
					}
					
				}
				else {
					//插入照片失败
					return 400;
				}
				
			}
		}
		else {
			//在worker中查不到这位歌手
			//在worker表和creator表里面都添加这个人
			//先在worker表里面添加
			int resinsertworker=DatabaseUtil.update("insert into worker (name) values ('"+singer_name+"');");
			if(resinsertworker==1) {
				//插入成功，获取worker——id当作creator的c_id
				ResultSet resworkerid=DatabaseUtil.query("select max(worker_id) from worker;");
				if(resworkerid.next()) {
					//成功获取到了workerid
					singer_id=Integer.parseInt(resworkerid.getString(1));
					//得到了歌手的id
				}
				else {
					return 400;
				}
			}
			else {
				return 400;
			}
			//插入照片，可以将之前的代码直接复制
			int resinsertpicture=DatabaseUtil.update("insert into picture(location) values ('"+picture_location+"');");
			if(resinsertpicture==1) {
				//插入照片成功
				ResultSet respicture=DatabaseUtil.query("select max(pic_id) from picture;");
				//获得照片的id
				if(respicture.next()) {
					picture_id=Integer.parseInt(respicture.getString(1));
					//成功得到照片的id
				}
				else {
					//获取照片id的行为失败
					return 400;
				}
				
			}
			else {
				//插入照片失败
				return 400;
			}
			
		}
		//无论worker表里面有没有他，照片和singer_id就绪，可以向creator表里面添加歌手信息
		String insertcreator="insert into creator(c_id,name,gender,country,area,remark,firstchar,cover) values ("+singer_id+",'"+singer_name+"','"+gender+"','"+country+"','"+area+"','"+remark+"','"+firstchar_singer+"',"+picture_id+");";
		int resinsertintocreator=DatabaseUtil.update(insertcreator);
		if(resinsertintocreator==1) {
			//该插入的都已经插入了，插入歌手成功
			return 200;
		}
		else {
			return 400;
		}

	}
	
	
	/**
	 * 向数据库中插入专辑
	 * @return 200成功
	 * @return 300已存在
	 * @return 400失败
	 * @throws SQLException 
	 */
	public static int addalbum(String album_name,String remark,String releaseDate,String picture_location) throws SQLException {
		int picture_id=0;
		String firstchar_album=ChineseCharToEn.getPinYinHeadChar(album_name);
		
		
		//先检查该专辑是否存在
		ResultSet resalbum=DatabaseUtil.query("select alb_id from album where releaseDate='"+releaseDate+"' and alb_name='"+album_name+"';");
		if(resalbum.next()) {
			//说明该专辑已经存在
			return 300;
		}
		else {
			//没有在album表里面找到该专辑
			//在album表里面为这张专辑新建一行
			//首先先把picture插入到picture表中
			int insertpicture=DatabaseUtil.update("insert into picture (location) values ('"+picture_location+"');");
			if(insertpicture==1) {
				//成功插入照片，该获取照片的id了
				ResultSet respicture=DatabaseUtil.query("select max(pic_id) from picture");
				if(respicture.next()) {
					//获取到照片的id
					picture_id=Integer.parseInt(respicture.getString(1));
				}
				else {
					//没有获取到照片的id
					return 400;
				}
			}
			else {
				return 400;
			}		
			
		}
		//照片搞定，正式插入album数据
		int insertalbum=DatabaseUtil.update("insert into album (alb_name,cover,remark,releaseDate,firstchar) values ('"+album_name+"',"+picture_id+",'"+remark+"','"+releaseDate+"','"+firstchar_album+"');");
		if(insertalbum==1) {
			//album表插入成功
			return 200;
		}
		else {
			return 400;
		}
	}
	
	
	
	
	}
	
	

