package by.gov.dha.dao;

import by.gov.dha.dao.properties.JDBCProperties;
import by.gov.dha.document.Doc;
import by.gov.dha.document.SqlQuery;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.*;

@Repository
public class SqlValuesImpl implements SqlValues {

    private final static String PROPERTY_NAME = "DataBaseProperties";
    private final static ResourceBundle RESOURCE_BUNDLE = ResourceBundle.getBundle(PROPERTY_NAME);

    private static final String DB_URL = RESOURCE_BUNDLE.getString(JDBCProperties.DB_CONNECTION.name());
    private static final String DB_DRIVER = RESOURCE_BUNDLE.getString(JDBCProperties.DB_DRIVER.name());
    private static final String DB_USER = RESOURCE_BUNDLE.getString(JDBCProperties.DB_USER.name());
    private static final String DB_PASSWORD = RESOURCE_BUNDLE.getString(JDBCProperties.DB_PASSWORD.name());

    private static final String COLUMN_ID = "ID";
    private static final String COLUMN_DETAIL = "NAME";

    private Map<Integer, String> fieldNumMap = new HashMap<Integer, String>();

    public Map<String, List<String>> getSqlQueryFromDoc(Doc doc) {
        Map<String, List<String>> sqlValuesMap = new HashMap<>();
        for (SqlQuery sqlQuery : doc.getDocSql().getSqlQuery()) {
            if (sqlQuery.getSqlForTable() == 0 || sqlQuery.getSqlForTable() == null) {
                try {
                    sqlValuesMap.put(sqlQuery.getSqlKey(), getArgumentList(sqlQuery.getSqlQuery()));
                } catch (SQLException e) {
                    System.out.println("ERROR: " + e.getErrorCode());
                }
            }
        }
        return sqlValuesMap;
    }


    private List<String> getArgumentList(String sqlQuery) throws SQLException {

        List<String> resultList = new ArrayList<>();

        Connection dbConnection = null;
        PreparedStatement preparedStatement = null;

        try {
            dbConnection = getDBConnection();
            preparedStatement = dbConnection.prepareStatement(sqlQuery);

            ResultSet set = preparedStatement.executeQuery();
            while (set.next()) {
                resultList.add(set.getString(COLUMN_DETAIL));
            }
            return resultList;

        } catch (SQLException e) {
            System.out.println("ERROR: " + e.getMessage());
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (dbConnection != null) {
                dbConnection.close();
            }
        }
        return null;
    }


    private Connection getDBConnection() {
        Connection dbConnection = null;
        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            System.out.println("ERROR: " + e.getMessage());
        }
        try {
            dbConnection = DriverManager.getConnection(
                    DB_URL, DB_USER, DB_PASSWORD);
            return dbConnection;
        } catch (SQLException e) {
            System.out.println("ERROR: " + e.getMessage());
        }
        return null;
    }


    /////////////////////////////////////////////////////////////////////////////////

    public Map<String, Map<String, Map<String, String>>> getNewRowValue(Doc doc) {
        fieldNumMap.put(1, "num40");
        fieldNumMap.put(2, "num50");
        fieldNumMap.put(3, "num60");
        fieldNumMap.put(4, "num70");
        fieldNumMap.put(5, "num80");
        fieldNumMap.put(6, "num90");
        Map<String, Map<String, Map<String, String>> > sqlValuesMap = new HashMap<>();
        for (SqlQuery sqlQuery : doc.getDocSql().getSqlQuery()) {
            if (sqlQuery.getSqlForTable() == 1) {
                try {
                    sqlValuesMap.put(sqlQuery.getSqlKey(), getValuesForNewRow(sqlQuery.getSqlQuery()));//столбец num20 и мапа значений
                } catch (SQLException e) {
                    System.out.println("ERROR: " + e.getErrorCode() + " line: 104");
                }
            }
        }
        return sqlValuesMap;
    }


    private Map<String, Map<String, String>> getValuesForNewRow(String sqlQuery) throws SQLException {

        Map<String, Map<String, String>> mapMain = new HashMap<>();

        Connection dbConnection = null;
        PreparedStatement preparedStatement = null;

        try {
            dbConnection = getDBConnection();
            preparedStatement = dbConnection.prepareStatement(sqlQuery);
            ResultSet set = preparedStatement.executeQuery();
            int setSize = set.getMetaData().getColumnCount();
            while (set.next()) {
                Map<String, String> map = new HashMap<>();
                for (int i = 1; i <= setSize; i++) {
                    map.put(fieldNumMap.get(i), set.getString(i));
                }
                mapMain.put(map.get("num40"), map);
            }
            return mapMain;

        } catch (SQLException e) {
            System.out.println("ERROR: " + e.getMessage() + " line: 163");
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (dbConnection != null) {
                dbConnection.close();
            }
        }
        return null;
    }


}
