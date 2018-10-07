package by.gov.dha.controller;


import by.gov.dha.document.Doc;
import by.gov.dha.document.SimpleTableValues;
import by.gov.dha.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping(value = "/")
@SessionAttributes("sessionDoc")
public class AppController {

    private String var;
    private Doc mainDoc;

    @Autowired
    private DocTableService docTableService;

    @Autowired
    private DocService docService;

    @Autowired
    private SQLValuesService sqlValuesService;

    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String goToTest(ModelMap modelMap) throws Exception {

        Doc doc = docService.getDoc();

        modelMap.addAttribute("document", doc);
        modelMap.addAttribute("sessionDoc", doc);

        modelMap.addAttribute("docAssetsPaths", new SimpleTableValues().getSimpleTablePath(doc.getDocAssets()));
        modelMap.addAttribute("docWastePaths", new SimpleTableValues().getSimpleTablePath(doc.getDocWaste()));
        modelMap.addAttribute("docServicesPaths", new SimpleTableValues().getSimpleTablePath(doc.getDocServices()));
        modelMap.addAttribute("docAssetsList", new SimpleTableValues().getValue(doc.getDocAssets()));
        modelMap.addAttribute("docWasteList", new SimpleTableValues().getValue(doc.getDocWaste()));
        modelMap.addAttribute("docServicesList", new SimpleTableValues().getValue(doc.getDocServices()));


        modelMap.addAttribute("values", sqlValuesService.getSqlQueryFromDoc(doc));
        modelMap.addAttribute("newTableRowValue", sqlValuesService.getNewRowValue(doc));
        modelMap.addAttribute("docWasteObj", doc.getDocWaste());
        modelMap.addAttribute("docAssetsObj", doc.getDocAssets());
        modelMap.addAttribute("docServicesObj", doc.getDocServices());

        return "WEB-INF/views/MAIN";
    }


    @RequestMapping(value = "/testNext", method = RequestMethod.POST)
    public String nextPage(ModelMap modelMap, @ModelAttribute("sessionDoc") Doc sessionDoc) throws Exception {

        Doc doc = docTableService.deleteIdRowValue(sessionDoc);

        docService.saveDoc(doc);

        modelMap.addAttribute("document", doc);
        modelMap.addAttribute("sessionDoc", doc);

        modelMap.addAttribute("docAssetsPaths", new SimpleTableValues().getSimpleTablePath(doc.getDocAssets()));
        modelMap.addAttribute("docWastePaths", new SimpleTableValues().getSimpleTablePath(doc.getDocWaste()));
        modelMap.addAttribute("docServicesPaths", new SimpleTableValues().getSimpleTablePath(doc.getDocServices()));
        modelMap.addAttribute("docAssetsList", new SimpleTableValues().getValue(doc.getDocAssets()));
        modelMap.addAttribute("docWasteList", new SimpleTableValues().getValue(doc.getDocWaste()));
        modelMap.addAttribute("docServicesList", new SimpleTableValues().getValue(doc.getDocServices()));

        modelMap.addAttribute("values", sqlValuesService.getSqlQueryFromDoc(doc));
        modelMap.addAttribute("newTableRowValue", sqlValuesService.getNewRowValue(doc));
        modelMap.addAttribute("docWasteObj", doc.getDocWaste());
        modelMap.addAttribute("docAssetsObj", doc.getDocAssets());
        modelMap.addAttribute("docServicesObj", doc.getDocServices());
        return "WEB-INF/views/MAIN";
    }

    @RequestMapping(value = "/ajaxTest", method = RequestMethod.POST)
    public void ajaxTest(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
                         @ModelAttribute("sessionDoc") Doc doc) throws ServletException, IOException {
        var = request.getParameter("testParam");
//        modelMap.addAttribute("sessionDoc", docWasteService.addRow(doc, sqlValuesService.getNewRowValue(doc).get("test"), var));
//        Doc emptyRowDoc = docWasteService.deleteIdRowValue(doc);
        modelMap.addAttribute("sessionDoc", docTableService.addRow(doc, sqlValuesService.getNewRowValue(doc).get("test"), var));
        Doc emptyRowDoc = docTableService.deleteIdRowValue(doc);
        docService.saveDoc(emptyRowDoc);
        mainDoc = emptyRowDoc;
        var = null;

    }


    @RequestMapping(value = "/tablePage", method = RequestMethod.POST)
    public String goAfterSaving(ModelMap modelMap) throws Exception {

        Doc doc = docService.getDoc();

        modelMap.addAttribute("document", doc);
        modelMap.addAttribute("sessionDoc", doc);

        modelMap.addAttribute("docAssetsPaths", new SimpleTableValues().getSimpleTablePath(doc.getDocAssets()));
        modelMap.addAttribute("docWastePaths", new SimpleTableValues().getSimpleTablePath(doc.getDocWaste()));
        modelMap.addAttribute("docServicesPaths", new SimpleTableValues().getSimpleTablePath(doc.getDocServices()));
        modelMap.addAttribute("docAssetsList", new SimpleTableValues().getValue(doc.getDocAssets()));
        modelMap.addAttribute("docWasteList", new SimpleTableValues().getValue(doc.getDocWaste()));
        modelMap.addAttribute("docServicesList", new SimpleTableValues().getValue(doc.getDocServices()));

        modelMap.addAttribute("values", sqlValuesService.getSqlQueryFromDoc(doc));
        modelMap.addAttribute("newTableRowValue", sqlValuesService.getNewRowValue(doc));
        modelMap.addAttribute("docWasteObj", doc.getDocWaste());
        modelMap.addAttribute("docAssetsObj", doc.getDocAssets());
        modelMap.addAttribute("docServicesObj", doc.getDocServices());

        return "index";
    }


}

