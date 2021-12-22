package com.searchmodules;

import com.searchmodules.pages.SearchPage;
import com.tests.BaseTest;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

public class SearchTest extends BaseTest {

    @Test

    @Parameters({ "keyword" })
    public void search(String keyword) {

        SearchPage searchPage = new SearchPage(driver);
        searchPage.goTo();
        searchPage.doSearch("java");
        searchPage.goToVideos();
        int size = searchPage.getResult();

        Assert.assertTrue(size > 0);
    }
}
