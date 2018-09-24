package by.gov.dha.document;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SimpleTableValues {

    List<Map<Integer, String>> valuesMapsList = new ArrayList<>();
    List<Map<Integer, String>> pathMapsList = new ArrayList<>();


    Map<String, String> valuesMap = new HashMap<>();

    public Map<String, String> getValue(SimpleTable simpleTable) {
        try {
            for (Row row : simpleTable.getTableData().getRow()) {
                for (Field field : row.getField()) {
                    valuesMap.put(field.getPath(), field.getValue());
                }
            }
            return valuesMap;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Map<Integer, String>> getSimpleTableData(SimpleTable simpleTable) {
        try {
            for (Row row : simpleTable.getTableData().getRow()) {
                Map<Integer, String> valuesMap = new HashMap<>();
                for (Field field : row.getField()) {
                    valuesMap.put(field.getNum(), field.getValue());
                }
                valuesMapsList.add(valuesMap);
            }
            return valuesMapsList;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Map<Integer, String>> getSimpleTablePath(SimpleTable simpleTable) throws Exception {
        try {
            for (Row row : simpleTable.getTableData().getRow()) {
                Map<Integer, String> pathsMap = new HashMap<>();
                for (Field field : row.getField()) {
                    pathsMap.put(field.getNum(), field.getPath());
                }
                pathMapsList.add(pathsMap);
            }
            return pathMapsList;
        } catch (Exception e) {
        }
        return null;
    }


//    public Map<Integer, String> getSimpleTableData(SimpleTable simpleTable) {
//        for (Row row : simpleTable.getTableData().getRow()){
//            for (Field field : row.getField()){
//                valueMap.put(field.getNum(), field.getValue());
//            }
//        }
//        return valueMap;
//    }

}
