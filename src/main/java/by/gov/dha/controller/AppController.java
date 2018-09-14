package by.gov.dha.controller;


import by.gov.dha.document.Doc;
import by.gov.dha.document.SimpleTableValues;
import by.gov.dha.service.DocService;
import by.gov.dha.service.SQLValuesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/")
@SessionAttributes("sessionDoc")
public class AppController {

    @Autowired
    private DocService docService;

    @Autowired
    private SQLValuesService sqlValuesService;

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String goToTest(ModelMap modelMap, HttpSession session) throws Exception {

        modelMap.addAttribute("document", docService.getDoc());

        modelMap.addAttribute("sessionDoc", docService.getDoc());

        modelMap.addAttribute("docWasteList", new SimpleTableValues().getSimpleTableData(docService.getDoc().getDocWaste()));
        modelMap.addAttribute("docAssetsList", new SimpleTableValues().getSimpleTableData(docService.getDoc().getDocAssets()));
        modelMap.addAttribute("docServicesList", new SimpleTableValues().getSimpleTableData(docService.getDoc().getDocServices()));

//        modelMap.addAttribute("values", sqlValuesService.getSqlQueryFromDoc(docService.getDoc()));

        return "MAIN";
    }


    @RequestMapping(value = "/testNext", method = RequestMethod.GET)
    public String nextPage(ModelMap modelMap, @ModelAttribute("sessionDoc") Doc doc) throws Exception {

        docService.saveDoc(doc);

        modelMap.addAttribute("document", docService.getDoc());

        modelMap.addAttribute("docWasteList", new SimpleTableValues().getSimpleTableData(docService.getDoc().getDocWaste()));
        modelMap.addAttribute("docAssetsList", new SimpleTableValues().getSimpleTableData(docService.getDoc().getDocAssets()));
        modelMap.addAttribute("docServicesList", new SimpleTableValues().getSimpleTableData(docService.getDoc().getDocServices()));

        return "MAIN";
    }



    
}
