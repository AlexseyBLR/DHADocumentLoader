package by.gov.dha.service;

import by.gov.dha.document.Doc;

import java.util.Map;

public interface DocTableService {

    Doc deleteIdRowValue(Doc doc);


    Doc addRow(Doc doc, Map<String, Map<String, String>> values, String value);

}
