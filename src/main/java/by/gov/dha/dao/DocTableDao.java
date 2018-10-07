package by.gov.dha.dao;

import by.gov.dha.document.Doc;

import java.util.Map;

public interface DocTableDao {

    Doc deleteIdRowValue(Doc doc);

    Doc addRow(Doc doc, Map<String, Map<String, String>> values, String value);

}
