package by.gov.dha.service;

import by.gov.dha.dao.DocTableDao;
import by.gov.dha.document.Doc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service
public class DocTableServiceImp implements DocTableService {

    @Autowired
    private DocTableDao docTableDao;

    @Override
    public Doc deleteIdRowValue(Doc doc) {
        return docTableDao.deleteIdRowValue(doc);
    }

    @Override
    public Doc addRow(Doc doc, Map<String, Map<String, String>> values, String value) {
        return docTableDao.addRow(doc, values, value);
    }
}
