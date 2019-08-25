package sql_connect;

import java.sql.*;

import javafx.scene.chart.PieChart.Data;
import sql_connect.DatabaseUtil;
import tool_class.ChineseCharToEn;


public class Insert {
	/**
	 * �����ݿ��в����µĸ���
	 * @return 200�ɹ�
	 * @return 400ʧ��
	 */
	public static int  addmusic(String music_name,String singer_name,String lyricist,String arrangenment,String remark,String video_location,String audio_location,String accmopany_location) throws SQLException {
		//�ȼ�鳪���׸�ĸ����ǲ����Ѿ���creator�����ˣ�������ھ��½�һ��
		String querysinger="select c_id from creator where name='"+singer_name+"';";
		ResultSet singer=DatabaseUtil.query(querysinger);
		int worker_id=0;
		int lyricist_id=0;
		int arrangement_id=0;
		String firstchar_music=ChineseCharToEn.getPinYinHeadChar(music_name);;
		String firstchar_singer=ChineseCharToEn.getPinYinHeadChar(singer_name);
		if(singer.next()==false) {
			//û�ҵ�
			//����һ����worker��������û�������
			String queryworker="select worker_id from worker where name='"+singer_name+"';";
			ResultSet resqueryworker=DatabaseUtil.query(queryworker);
			System.out.println("��worker���в��Ҹø���");
			if(resqueryworker.next()==false) {
				//˵����������������ĸ����ﶼ�����ڣ���worker�����creator�����涼Ҫ�½�һ��
				//����worker���������
				System.out.println("��worker���в�����");
				String insertworker="insert into worker (name) values ('"+singer_name+"');";
				int resinsertworker=DatabaseUtil.update(insertworker);
				if(resinsertworker==1) {
					//����ɹ���Ҫ��ȡ�����worker_id
					System.out.println("����ɹ���Ҫ��ȡ�����worker_id");
					String queryworkerid="select worker_id from worker where name='"+singer_name+"';";
					ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
					if(resworkerid.next()==false) {
					//����ʧ��
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
						//�ɹ����벢��ȡ��worker_id
						//resworkerid.next();
						worker_id=Integer.parseInt(resworkerid.getString(1));
						System.out.println(worker_id);
					}
				}
				
				else {
					//����workerʧ��
					for(int i=0;i<3;i++) {
						resinsertworker=DatabaseUtil.update(insertworker);
						if (resinsertworker==1) {  
							//����ɹ���Ҫ��ȡ�����worker_id
							String queryworkerid="select worker_id from worker where name='"+singer_name+"';";
							ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
							if(resworkerid.next()==false) {
								for(int j=0;j<3;j++) {
									resworkerid=DatabaseUtil.query(queryworkerid);
									if (resworkerid.next()) {
										//�õ���worker����id
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
								//�ɹ����벢��ȡ��worker_id
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
					
					//��creator���и��ݵõ���worker_id������ֵ�id�������Լ�����ĸ
				String insert_singer="insert into creator(c_id,name,firstchar) values ('"+worker_id+"','"+singer_name+"','"+firstchar_singer+"');";
				int resinsertsinger=DatabaseUtil.update(insert_singer);
				if(resinsertsinger!=1) {
					//����ʧ��
					for(int i=0;i<3;i++) {
						//���Բ�������ֱ���ɹ�
						resinsertsinger=DatabaseUtil.update(insert_singer);
						if(resinsertsinger==1) {
							break;
						}
						else {
							if(i==2)
								//�ظ����ε���û�в���ɹ����򷵻ر��β���ʧ��
								return 400;
						}
					}
				}
			}
			}
		else {
			//˵����Ȼ�ڸ��ֱ�����û�У�����������������ʻ�����
			//ͨ��worker���ȡ����id������creator�����½�һ�����ĸ�����Ϣ
			String queryworkerid="select worker_id from worker where name='"+singer_name+"';";
			ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
			if(resworkerid.next()==false) {
				for(int i=0;i<3;i++) {
					resworkerid=DatabaseUtil.query(queryworkerid);
					if (resworkerid.next()) {
						//�õ���worker����id
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
				//�ɹ���ȡ��worker_id
				//resworkerid.next();
				worker_id=Integer.parseInt(resworkerid.getString(1));
				System.out.println(worker_id);
			}
	
	//��creator���и��ݵõ���worker_id������ֵ�id������
			String insert_singer="insert into creator(c_id,name,firstchar) values ('"+worker_id+"','"+singer_name+"','"+firstchar_singer+"');";
   int resinsertsinger=DatabaseUtil.update(insert_singer);
if(resinsertsinger!=1) {
	//����ʧ��
	for(int i=0;i<3;i++) {
		//���Բ�������ֱ���ɹ�
		resinsertsinger=DatabaseUtil.update(insert_singer);
		if(resinsertsinger==1) {
			break;
		}
		else {
			if(i==2)
				//�ظ����ε���û�в���ɹ����򷵻ر��β���ʧ��
				return 400;
		}
	}
}
}
		}
		else {
			//ֱ����creator�������ҵ����Ǹ�����
			//singer.next();
			worker_id=Integer.parseInt(singer.getString(1));
			System.out.println(worker_id);
			
		}
			
			
        //���˸��ֵĲ������ѯ����ˣ�Ȼ��ý������������������
		
		
		
		//�������ʵĲ������ѯ
		String querylyricist="select music_workerID from music_worker where music_workerName='"+lyricist+"' and position='����';";
		ResultSet resquerylyricist=DatabaseUtil.query(querylyricist);
		if(resquerylyricist.next()==false) {
			//û�ҵ�
			//����һ����worker��������û�������
			System.out.println("���ʱ���û�ҵ�����worker������");
			String queryworker="select worker_id from worker where name='"+lyricist+"';";
			ResultSet resqueryworker=DatabaseUtil.query(queryworker);
			if(resqueryworker.next()==false) {
				//˵����������������ĸ����ﶼ�����ڣ���worker�����music_worker�����涼Ҫ�½�һ��
				//����worker���������
				String insertworker="insert into worker (name) values ('"+lyricist+"');";
				int resinsertworker=DatabaseUtil.update(insertworker);
				if(resinsertworker==1) {
					//����ɹ���Ҫ��ȡ�����worker_id
					String queryworkerid="select worker_id from worker where name='"+lyricist+"';";
					ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
					if(resworkerid.next()==false) {
					//����ʧ��
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
						//�ɹ����벢��ȡ��worker_id
						//resworkerid.next();
						lyricist_id=Integer.parseInt(resworkerid.getString(1));
						System.out.println(lyricist_id);
					}
				}
				
				else {
					//����workerʧ��
					for(int i=0;i<3;i++) {
						resinsertworker=DatabaseUtil.update(insertworker);
						if (resinsertworker==1) {  
							//����ɹ���Ҫ��ȡ�����worker_id
							String queryworkerid="select worker_id from worker where name='"+lyricist+"';";
							ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
							if(resworkerid.next()==false) {
								for(int j=0;j<3;j++) {
									resworkerid=DatabaseUtil.query(queryworkerid);
									if (resworkerid.next()) {
										//�õ���lyricist����id
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
								//�ɹ����벢��ȡ��lyricist_id
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
					
					//��music_worker���и��ݵõ���lyricist_id�������ʵ�id������
				String insert_lyricist="insert into music_worker(music_workerID,music_workerName,position) values ('"+lyricist_id+"','"+lyricist+"','����');";
				int resinsertlyricist=DatabaseUtil.update(insert_lyricist);
				if(resinsertlyricist!=1) {
					//����ʧ��
					for(int i=0;i<3;i++) {
						//���Բ�������ֱ���ɹ�
						resinsertlyricist=DatabaseUtil.update(insert_lyricist);
						if(resinsertlyricist==1) {
							break;
						}
						else {
							if(i==2)
								//�ظ����ε���û�в���ɹ����򷵻ر��β���ʧ��
								return 400;
						}
					}
				}
			}
			}
		else {
			//˵����Ȼ�����ʱ�����û�У�����������������������
			//ͨ��worker���ȡ����id������creator�����½�һ�����ĸ�����Ϣ
			String querylyricistid="select worker_id from worker where name='"+lyricist+"';";
			ResultSet reslyricistid=DatabaseUtil.query(querylyricistid);
			if(reslyricistid.next()==false) {
				//û���ҵ�workerid
				for(int i=0;i<3;i++) {
					reslyricistid=DatabaseUtil.query(querylyricistid);
					if (reslyricistid.next()) {
						//�õ���worker����id
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
				//�ɹ���ȡ��worker_id
				//reslyricistid.next();
				lyricist_id=Integer.parseInt(reslyricistid.getString(1));
				System.out.println(lyricist_id);
			}
			//��music_worker���и��ݵõ���lyricist_id�������ʵ�id������
			String insert_lyricist="insert into music_worker(music_workerID,music_workerName,position) values ('"+lyricist_id+"','"+lyricist+"','����');";
			int resinsertlyricist=DatabaseUtil.update(insert_lyricist);
			if(resinsertlyricist!=1) {
				//����ʧ��
				for(int i=0;i<3;i++) {
					//���Բ�������ֱ���ɹ�
					resinsertlyricist=DatabaseUtil.update(insert_lyricist);
					if(resinsertlyricist==1) {
						break;
					}
					else {
						if(i==2)
							//�ظ����ε���û�в���ɹ����򷵻ر��β���ʧ��
							return 400;
					}
				}
			}
}
		}
		else {
			//ֱ����creator�������ҵ����Ǹ�����
			//resquerylyricist.next();
			lyricist_id=Integer.parseInt(resquerylyricist.getString(1));
			
		}
		
		
		 //���˸��ֺ����ʵĲ������ѯ����ˣ�Ȼ��ý������������
		
		
		//�������ʵĲ������ѯ
		String queryarrangement="select music_workerID from music_worker where music_workerName='"+arrangenment+"' and position='����';";
		ResultSet resqueryarrangement=DatabaseUtil.query(queryarrangement);
		if(resqueryarrangement.next()==false) {
			//û�ҵ�
			//����һ����worker��������û�������
			String queryworker="select worker_id from worker where name='"+arrangenment+"';";
			ResultSet resqueryworker=DatabaseUtil.query(queryworker);
			if(resqueryworker.next()==false) {
				//˵����������������ĸ����ﶼ�����ڣ���worker�����music_worker�����涼Ҫ�½�һ��
				//����worker���������
				String insertworker="insert into worker (name) values ('"+arrangenment+"');";
				int resinsertworker=DatabaseUtil.update(insertworker);
				if(resinsertworker==1) {
					//����ɹ���Ҫ��ȡ�����worker_id
					String queryworkerid="select worker_id from worker where name='"+arrangenment+"';";
					ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
					if(resworkerid.next()==false) {
					//��ѯʧ��
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
						//�ɹ����벢��ȡ��worker_id
						//resworkerid.next();
						arrangement_id=Integer.parseInt(resworkerid.getString(1));
						System.out.println(arrangement_id);
					}
				}
				
				else {
					//����workerʧ��
					for(int i=0;i<3;i++) {
						resinsertworker=DatabaseUtil.update(insertworker);
						if (resinsertworker==1) {  
							//����ɹ���Ҫ��ȡ�����worker_id
							String queryworkerid="select worker_id from worker where name='"+arrangenment+"';";
							ResultSet resworkerid=DatabaseUtil.query(queryworkerid);
							if(resworkerid.next()==false) {
								for(int j=0;j<3;j++) {
									resworkerid=DatabaseUtil.query(queryworkerid);
									if (resworkerid.next()) {
										//�õ���arrangement����id
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
								//�ɹ����벢��ȡ��lyricist_id
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
					
					//��music_worker���и��ݵõ���arrangemnt_id�������ʵ�id������
				String insert_arrangement="insert into music_worker(music_workerID,music_workerName,position) values ('"+arrangement_id+"','"+arrangenment+"','����');";
				int resinsertarrangement=DatabaseUtil.update(insert_arrangement);
				if(resinsertarrangement!=1) {
					//����ʧ��
					for(int i=0;i<3;i++) {
						//���Բ�������ֱ���ɹ�
						resinsertarrangement=DatabaseUtil.update(insert_arrangement);
						if(resinsertarrangement==1) {
							break;
						}
						else {
							if(i==2)
								//�ظ����ε���û�в���ɹ����򷵻ر��β���ʧ��
								return 400;
						}
					}
				}
			}
			}
		else {
			//˵����Ȼ������������û�У�����������������ʻ����
			//ͨ��worker���ȡ����id������music_worker�����½�һ�����ĸ�����Ϣ
			String queryarrangementid="select worker_id from worker where name='"+arrangenment+"';";
			ResultSet resarrangementid=DatabaseUtil.query(queryarrangementid);
			if(resarrangementid.next()==false) {
				for(int i=0;i<3;i++) {
					resarrangementid=DatabaseUtil.query(queryarrangementid);
					if (resarrangementid.next()) {
						//�õ���worker����id
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
				//�ɹ���ȡ��worker_id
				//resarrangementid.next();
				arrangement_id=Integer.parseInt(resarrangementid.getString(1));
				System.out.println(arrangement_id);
			}
			//��music_worker���и��ݵõ���arrangement_id�������ʵ�id������
			String insert_arrangement="insert into music_worker(music_workerID,music_workerName,position) values ('"+arrangement_id+"','"+arrangenment+"','����');";
			int resinsertarrangement=DatabaseUtil.update(insert_arrangement);
			if(resinsertarrangement!=1) {
				//����ʧ��
				for(int i=0;i<3;i++) {
					//���Բ�������ֱ���ɹ�
					resinsertarrangement=DatabaseUtil.update(insert_arrangement);
					if(resinsertarrangement==1) {
						break;
					}
					else {
						if(i==2)
							//�ظ����ε���û�в���ɹ����򷵻ر��β���ʧ��
							return 400;
					}
				}
			}
}
		}
		else {
			//ֱ����creator�������ҵ����Ǹ�����
			//resqueryarrangement.next();
			arrangement_id=Integer.parseInt(resqueryarrangement.getString(1));

		}
		
		
		//���֣����ʣ�����ȫ���㶨��������Ҫ��ʽ�����ݿ��в�����music�йص���Ϣ��
		//ȷ��������music������ĸ������ChineseCharToEn.java
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
			//����ɹ�������musicmessage��m_id����������newm_id�����²����music��m_id
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
	 * �����ݿ��в����µĸ���
	 * @return 200�ɹ�
	 * @return 300����ĸ����Ѵ���
	 * @return 400ʧ��
	 * @throws SQLException 
	 * 
	 */
	public static int addsinger(String singer_name,String gender,String country,String area,String remark,String picture_location) throws SQLException {
		String firstchar_singer=ChineseCharToEn.getPinYinHeadChar(singer_name);
		int singer_id=0;
		int picture_id=0;
		//�Ȳ�ѯ��worker����û����λ����
		ResultSet ressinger=DatabaseUtil.query("select worker_id from worker where name='"+singer_name+"';");
		if(ressinger.next()) {
			//��worker�в鵽����λ���ֵ���Ϣ
			//�Ȼ�����worker��workerid
			//��creator�����ٽ��в�ѯ��������ڣ��򷵻�300
			singer_id = Integer.parseInt(ressinger.getString(1));
			ResultSet rescreator=DatabaseUtil.query("select c_id from creator where c_id="+singer_id+");");
			if(rescreator.next()) {
				//˵�����������creator�������Ѿ������ˣ����Է���300
			    return 300;
			}
			else {
				//˵�����������Ȼ��worker�������У����������ʻ�����������ݣ�Ӧ����creator������Ϊ���½�һ����¼
				//����creator��������cover�������Ȱ���Ƭ���뵽picture����ȥ���Ҹ㵽pic_id
				int resinsertpicture=DatabaseUtil.update("insert into picture(location) values ('"+picture_location+"');");
				if(resinsertpicture==1) {
					//������Ƭ�ɹ�
					ResultSet respicture=DatabaseUtil.query("select max(pic_id) from picture;");
					//�����Ƭ��id
					if(respicture.next()) {
						picture_id=Integer.parseInt(respicture.getString(1));
						//�ɹ��õ���Ƭ��id
					}
					else {
						//��ȡ��Ƭid����Ϊʧ��
						return 400;
					}
					
				}
				else {
					//������Ƭʧ��
					return 400;
				}
				
			}
		}
		else {
			//��worker�в鲻����λ����
			//��worker���creator�����涼��������
			//����worker���������
			int resinsertworker=DatabaseUtil.update("insert into worker (name) values ('"+singer_name+"');");
			if(resinsertworker==1) {
				//����ɹ�����ȡworker����id����creator��c_id
				ResultSet resworkerid=DatabaseUtil.query("select max(worker_id) from worker;");
				if(resworkerid.next()) {
					//�ɹ���ȡ����workerid
					singer_id=Integer.parseInt(resworkerid.getString(1));
					//�õ��˸��ֵ�id
				}
				else {
					return 400;
				}
			}
			else {
				return 400;
			}
			//������Ƭ�����Խ�֮ǰ�Ĵ���ֱ�Ӹ���
			int resinsertpicture=DatabaseUtil.update("insert into picture(location) values ('"+picture_location+"');");
			if(resinsertpicture==1) {
				//������Ƭ�ɹ�
				ResultSet respicture=DatabaseUtil.query("select max(pic_id) from picture;");
				//�����Ƭ��id
				if(respicture.next()) {
					picture_id=Integer.parseInt(respicture.getString(1));
					//�ɹ��õ���Ƭ��id
				}
				else {
					//��ȡ��Ƭid����Ϊʧ��
					return 400;
				}
				
			}
			else {
				//������Ƭʧ��
				return 400;
			}
			
		}
		//����worker��������û��������Ƭ��singer_id������������creator��������Ӹ�����Ϣ
		String insertcreator="insert into creator(c_id,name,gender,country,area,remark,firstchar,cover) values ("+singer_id+",'"+singer_name+"','"+gender+"','"+country+"','"+area+"','"+remark+"','"+firstchar_singer+"',"+picture_id+");";
		int resinsertintocreator=DatabaseUtil.update(insertcreator);
		if(resinsertintocreator==1) {
			//�ò���Ķ��Ѿ������ˣ�������ֳɹ�
			return 200;
		}
		else {
			return 400;
		}

	}
	
	
	/**
	 * �����ݿ��в���ר��
	 * @return 200�ɹ�
	 * @return 300�Ѵ���
	 * @return 400ʧ��
	 * @throws SQLException 
	 */
	public static int addalbum(String album_name,String remark,String releaseDate,String picture_location) throws SQLException {
		int picture_id=0;
		String firstchar_album=ChineseCharToEn.getPinYinHeadChar(album_name);
		
		
		//�ȼ���ר���Ƿ����
		ResultSet resalbum=DatabaseUtil.query("select alb_id from album where releaseDate='"+releaseDate+"' and alb_name='"+album_name+"';");
		if(resalbum.next()) {
			//˵����ר���Ѿ�����
			return 300;
		}
		else {
			//û����album�������ҵ���ר��
			//��album������Ϊ����ר���½�һ��
			//�����Ȱ�picture���뵽picture����
			int insertpicture=DatabaseUtil.update("insert into picture (location) values ('"+picture_location+"');");
			if(insertpicture==1) {
				//�ɹ�������Ƭ���û�ȡ��Ƭ��id��
				ResultSet respicture=DatabaseUtil.query("select max(pic_id) from picture");
				if(respicture.next()) {
					//��ȡ����Ƭ��id
					picture_id=Integer.parseInt(respicture.getString(1));
				}
				else {
					//û�л�ȡ����Ƭ��id
					return 400;
				}
			}
			else {
				return 400;
			}		
			
		}
		//��Ƭ�㶨����ʽ����album����
		int insertalbum=DatabaseUtil.update("insert into album (alb_name,cover,remark,releaseDate,firstchar) values ('"+album_name+"',"+picture_id+",'"+remark+"','"+releaseDate+"','"+firstchar_album+"');");
		if(insertalbum==1) {
			//album�����ɹ�
			return 200;
		}
		else {
			return 400;
		}
	}
	
	
	
	
	}
	
	

