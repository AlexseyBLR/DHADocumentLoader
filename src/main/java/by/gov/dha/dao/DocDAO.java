package by.gov.dha.dao;

import by.gov.dha.document.Doc;

public interface DocDAO {

    Doc getDoc();

    void saveDoc(Doc document);

}
