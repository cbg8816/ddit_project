package kr.or.ddit.roomstatus.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomstatusMapper {

	/**roomtypeid=1, roomst 6
	 * @return
	 */
	public int selectroomTypeid1();
	/**roomtypeid=2, roomst 6
	 * @return
	 */
	public int selectroomTypeid2();
	/**roomtypeid=3, roomst 6
	 * @return
	 */
	public int selectroomTypeid3();
	/**roomtypeid=4, roomst 6
	 * @return
	 */
	public int selectroomTypeid4();
	/**roomtypeid=5, roomst 6
	 * @return
	 */
	public int selectroomTypeid5();


	/**roomst=1
	 * @return
	 */
	public int selectroomStatus1();
	/**roomst=2
	 * @return
	 */
	public int selectroomStatus2();
	/**roomst=3
	 * @return
	 */
	public int selectroomStatus3();
	/**roomst=4
	 * @return
	 */
	public int selectroomStatus4();
	/**roomst=5
	 * @return
	 */
	public int selectroomStatus5();
	/**roomst=6
	 * @return
	 */
	public int selectroomStatus6();
}
