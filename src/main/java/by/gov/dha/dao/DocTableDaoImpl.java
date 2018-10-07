package by.gov.dha.dao;

import by.gov.dha.document.Doc;
import by.gov.dha.document.Field;
import by.gov.dha.document.Row;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class DocTableDaoImpl implements DocTableDao {

    @Override
    public Doc deleteIdRowValue(Doc doc) {

        if(doc.getDocAssets() != null) {
            for (Row row : doc.getDocAssets().getTableData().getRow()) {
                if (row.getField().get(0).getValue().equals("")) {
                    row.setIdRow(0);
                }
            }
        }

        if(doc.getDocWaste() != null) {
            for (Row row : doc.getDocWaste().getTableData().getRow()) {
                if (row.getField().get(0).getValue().equals("")) {
                    row.setIdRow(0);
                }
            }
        }

        if(doc.getDocServices() != null) {
            for (Row row : doc.getDocAssets().getTableData().getRow()) {
                if (row.getField().get(0).getValue().equals("")) {
                    row.setIdRow(0);
                }
            }
        }
        return doc;
    }

    public Doc addRow(Doc doc, Map<String, Map<String, String>> values, String value){

        if(doc.getDocAssets() != null) {
            doc = addAssetsRow(doc, values, value);
        }

        if(doc.getDocWaste() != null) {
            doc = addWasteRow(doc, values, value);
        }

        if(doc.getDocServices() != null) {
            doc = addServicesRow(doc, values, value);
        }
        return doc;


    }


    public Doc addAssetsRow(Doc doc, Map<String, Map<String, String>> values, String value) {
        int rowNumber = 0;
        for (Row row : doc.getDocAssets().getTableData().getRow()) {
            if (row.getIdRow() == 0) {
                row.setIdRow(rowNumber+1);
                for (Field field : row.getField()) {
                    String fieldNum = "num" + String.valueOf(field.getNum());
                    if (fieldNum.equals("num20")) {
                        field.setValue(String.valueOf(rowNumber+1));
                    }
                    if (!fieldNum.equals("num20")) {
                        field.setValue(values.get(value).get(fieldNum));
                    }
                }
                break;
            } else {
                rowNumber++;
            }
        }
        return doc;
    }

    public Doc addWasteRow(Doc doc, Map<String, Map<String, String>> values, String value) {
        int rowNumber = 0;
        for (Row row : doc.getDocWaste().getTableData().getRow()) {
            if (row.getIdRow() == 0) {
                row.setIdRow(rowNumber+1);
                for (Field field : row.getField()) {
                    String fieldNum = "num" + String.valueOf(field.getNum());
                    if (fieldNum.equals("num20")) {
                        field.setValue(String.valueOf(rowNumber+1));
                    }
                    if (!fieldNum.equals("num20")) {
                        field.setValue(values.get(value).get(fieldNum));
                    }
                }
                break;
            } else {
                rowNumber++;
            }
        }
        return doc;
    }

    public Doc addServicesRow(Doc doc, Map<String, Map<String, String>> values, String value) {
        int rowNumber = 0;
        for (Row row : doc.getDocServices().getTableData().getRow()) {
            if (row.getIdRow() == 0) {
                row.setIdRow(rowNumber+1);
                for (Field field : row.getField()) {
                    String fieldNum = "num" + String.valueOf(field.getNum());
                    if (fieldNum.equals("num20")) {
                        field.setValue(String.valueOf(rowNumber+1));
                    }
                    if (!fieldNum.equals("num20")) {
                        field.setValue(values.get(value).get(fieldNum));
                    }
                }
                break;
            } else {
                rowNumber++;
            }
        }
        return doc;
    }

}
