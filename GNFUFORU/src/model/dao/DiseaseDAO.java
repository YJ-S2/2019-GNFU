package model.dao;

import java.sql.ResultSet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.disease.SearchController;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Disease;

public class DiseaseDAO {

    private static final Logger log = LoggerFactory.getLogger(SearchController.class);

   private JDBCUtil jdbcUtil = null;
   private static DiseaseDAO diseaseDao = new DiseaseDAO();

   public static DiseaseDAO getInstance() {
      return diseaseDao;
   }
   
   
   public DiseaseDAO() {
      jdbcUtil = new JDBCUtil(); 
   }

   public int remove(Disease disease) throws SQLException {
      String sql = "DELETE FROM DIS_SAVE WHERE save_id=? ";
      jdbcUtil.setSqlAndParameters(sql, new Object[] { disease.getSaveId()} );
 
      
      try {
         int result = jdbcUtil.executeUpdate();
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      } finally {
         jdbcUtil.commit();
         jdbcUtil.close();
      }
      return 0;
   }

   public int save(Disease disease) throws SQLException {
      String sql = "INSERT INTO DIS_SAVE VALUES ( SYSDATE, ?, ?, SAVE_ID_SEQ.nextVal)";
      Object[] param = new Object[] {disease.getDisSaveKcd(), disease.getUserId()};

      jdbcUtil.setSqlAndParameters(sql, param);
      
      try {
         int result = jdbcUtil.executeUpdate();   
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      } finally {
         jdbcUtil.commit();
         jdbcUtil.close();
      }
      return 0;

   }


   public List<Disease> findMySaveList(String userId) throws SQLException {
      String sql = "SELECT D.VISIT_DATE, D.DIS_ID, S.DIS_NAME, D.SAVE_ID "    
            + "FROM DIS_SAVE D JOIN DISEASE S  " 
            + "ON D.DIS_ID = S.DIS_KCD "
            + "WHERE D.USER_ID=? ";
      jdbcUtil.setSqlAndParameters(sql, new Object[] { userId });

      try {
         ResultSet rs = jdbcUtil.executeQuery();
         List<Disease> saveList = new ArrayList<Disease>();
         while (rs.next()) {
            log.debug("userSave Searching... : {}");
            
            Disease MySave = new Disease( 
                  rs.getDate("visit_date"), 
                  userId,               
                  rs.getString("dis_id"),
                  rs.getString("dis_name"),
                  rs.getString("save_id"));
            saveList.add(MySave);
         }
         return saveList;
   
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close(); // resource ÔøΩÎúùÔøΩÎ£ûÔøΩÏÇïÔøΩÏÜö
      }
      return null;
   }

   
   public List<Disease> findDiseaseList(String disKcd) throws SQLException {
      String sql = "SELECT * " + "FROM DISEASE " + "WHERE dis_kcd=? ";
      jdbcUtil.setSqlAndParameters(sql, new Object[] { disKcd }); // JDBCUtil

      try {
         ResultSet rs = jdbcUtil.executeQuery(); // query Ω««‡
         List<Disease> diseaseList = new ArrayList<Disease>(); // disease ∞·∞˙µÈ
         while (rs.next()) {
              
              log.debug("Disease Searching... : {}");

            Disease dis = new Disease( // Disease
                  rs.getString("dis_id"), 
                  rs.getString("dis_name"),
                  rs.getInt("dis_count"),
                  rs.getString("dis_kcd")
                  );
            diseaseList.add(dis); // ø©∑Ø∞°¡ˆ ¡˙∫¥µÈ ∏ÆΩ∫∆Æø° ¿˙¿Â.
         }
         return diseaseList;

      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close(); 
      }
      return null;
   }
}