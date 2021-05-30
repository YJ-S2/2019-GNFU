package model.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.disease.SearchController;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.*;

public class GynDAO {

   private JDBCUtil jdbcUtil = null;
   private static final Logger log = LoggerFactory.getLogger(GynDAO.class);
   private static GynDAO gynDao = new GynDAO();

   public static GynDAO getInstance() {
      return gynDao;
   }

   public GynDAO() {
      jdbcUtil = new JDBCUtil(); // JDBCUtil �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿰춯節륁삕 �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援�
   }
   
   /* 1219 沅뚮굹�쁺 怨좎튇遺�遺�*/
   public Gyn findGynDetailByGynId(String gynId) throws SQLException {

      String sql = "SELECT * " + "FROM GYN " + "WHERE GYN_ID=? ";
      jdbcUtil.setSqlAndParameters(sql, new Object[] { gynId }); // JDBCUtil�뜝�럥�맶�뜝�럥吏쀥뜝�럩援� query�뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥六울옙�벀�걠占쎄뎡
                                                   // �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援�
      Gyn gyn = null;
      try {
         ResultSet rs = jdbcUtil.executeQuery();
         while (rs.next()) {

            log.debug("Gyn Searching... : {}");

            gyn = new Gyn(
                  rs.getString("GYN_ADDR"), 
                  rs.getString("GYN_TEL"), 
                  rs.getString("GYN_TIME"),
                  rs.getString("GYN_NIGHT"),
                  rs.getString("GYN_LUNCH"),
                  rs.getString("UNIV_ID"), 
                  gynId, 
                  rs.getString("GYN_NAME")
               );
         }
         return gyn;
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close(); // resource �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럩�꼶
      }
      return null;
   }
   /* 1219 沅뚮굹�쁺 怨좎튇遺�遺�*/
   
   //湲곗〈
//   public List<Gyn> findGynListByGynId(String gynId) throws SQLException {
//
//      String sql = "SELECT * " + "FROM GYN " + "WHERE GYN_ID=? ";
//      jdbcUtil.setSqlAndParameters(sql, new Object[] { gynId }); // JDBCUtil�뜝�럥�맶�뜝�럥吏쀥뜝�럩援� query�뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥六울옙�벀�걠占쎄뎡
//                                                   // �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援�
//      try {
//         ResultSet rs = jdbcUtil.executeQuery();
//         List<Gyn> gynList = new ArrayList<Gyn>();
//         while (rs.next()) {
//
//            log.debug("Gyn Searching... : {}");
//
//            Gyn gyn = new Gyn(
//                  rs.getString("GYN_ADDR"), 
//                  rs.getString("GYN_TEL"), 
//                  rs.getString("GYN_TIME"),
//                  rs.getString("GYN_NIGHT"),
//                  rs.getString("GYN_LUNCH"),
//                  rs.getString("UNIV_ID"), 
//                  gynId, 
//                  rs.getString("GYN_NAME")
//               );
//            gynList.add(gyn);
//         }
//         return gynList;
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         jdbcUtil.close(); // resource �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럩�꼶
//      }
//      return null;
//   }
   
   /* 1219 沅뚮굹�쁺 怨좎튇遺�遺�*/
   public List<Gyn> findGynList(String uniId) throws SQLException {

      String sql = "SELECT * " + "FROM GYN_RANK R, GYN G " + "WHERE R.UNIV_ID=? AND R.GYN_ID = G.GYN_ID "
            + "ORDER BY NVL(R.REV_SUM / DECODE (R.REV_COUNT, 0, NULL, R.REV_COUNT), 0) DESC";
      jdbcUtil.setSqlAndParameters(sql, new Object[] { uniId }); // JDBCUtil�뜝�럥�맶�뜝�럥吏쀥뜝�럩援� query�뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥六울옙�벀�걠占쎄뎡
                                                   // �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援�
      try {
         ResultSet rs = jdbcUtil.executeQuery();
         List<Gyn> gynList = new ArrayList<Gyn>();
         while (rs.next()) {

            log.debug("Gyn Searching... : {}");

            Gyn gyn = new Gyn(
                  rs.getString("GYN_ADDR"), 
                  rs.getString("GYN_TEL"), 
                  rs.getString("GYN_TIME"),
                  rs.getString("GYN_NIGHT"),
                  rs.getString("GYN_LUNCH"),
                  uniId,
                  rs.getString("GYN_ID"), 
                  rs.getString("GYN_NAME")
               );
            gynList.add(gyn);
         }
         return gynList;
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close(); // resource �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럩�꼶
      }
      return null;
   }
   /* 1219 沅뚮굹�쁺 怨좎튇遺�遺�*/
   
   
   //湲곗〈 
//   public List<Gyn> findGynList(String uniId) throws SQLException {
//
//      String sql = "SELECT * " + "FROM GYN " + "WHERE UNIV_ID=? ";
//      jdbcUtil.setSqlAndParameters(sql, new Object[] { uniId }); // JDBCUtil�뜝�럥�맶�뜝�럥吏쀥뜝�럩援� query�뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥六울옙�벀�걠占쎄뎡
//                                                   // �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援�
//      try {
//         ResultSet rs = jdbcUtil.executeQuery();
//         List<Gyn> gynList = new ArrayList<Gyn>();
//         while (rs.next()) {
//
//            log.debug("Gyn Searching... : {}");
//
//            Gyn gyn = new Gyn(
//                  rs.getString("GYN_ADDR"), 
//                  rs.getString("GYN_TEL"), 
//                  rs.getString("GYN_TIME"),
//                  rs.getString("GYN_NIGHT"),
//                  rs.getString("GYN_LUNCH"),
//                  uniId,
//                  rs.getString("GYN_ID"), 
//                  rs.getString("GYN_NAME")
//               );
//            gynList.add(gyn);
//         }
//         return gynList;
//      } catch (Exception ex) {
//         ex.printStackTrace();
//      } finally {
//         jdbcUtil.close(); // resource �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럩�꼶
//      }
//      return null;
//   }
   
   
   
   
}