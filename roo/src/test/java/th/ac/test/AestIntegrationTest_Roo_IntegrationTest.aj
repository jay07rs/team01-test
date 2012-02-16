// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package th.ac.test;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import th.ac.test.Aest;
import th.ac.test.AestDataOnDemand;
import th.ac.test.AestIntegrationTest;

privileged aspect AestIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AestIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AestIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AestIntegrationTest: @Transactional;
    
    @Autowired
    private AestDataOnDemand AestIntegrationTest.dod;
    
    @Test
    public void AestIntegrationTest.testCountAests() {
        Assert.assertNotNull("Data on demand for 'Aest' failed to initialize correctly", dod.getRandomAest());
        long count = Aest.countAests();
        Assert.assertTrue("Counter for 'Aest' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AestIntegrationTest.testFindAest() {
        Aest obj = dod.getRandomAest();
        Assert.assertNotNull("Data on demand for 'Aest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Aest' failed to provide an identifier", id);
        obj = Aest.findAest(id);
        Assert.assertNotNull("Find method for 'Aest' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Aest' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AestIntegrationTest.testFindAllAests() {
        Assert.assertNotNull("Data on demand for 'Aest' failed to initialize correctly", dod.getRandomAest());
        long count = Aest.countAests();
        Assert.assertTrue("Too expensive to perform a find all test for 'Aest', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Aest> result = Aest.findAllAests();
        Assert.assertNotNull("Find all method for 'Aest' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Aest' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AestIntegrationTest.testFindAestEntries() {
        Assert.assertNotNull("Data on demand for 'Aest' failed to initialize correctly", dod.getRandomAest());
        long count = Aest.countAests();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Aest> result = Aest.findAestEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Aest' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Aest' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AestIntegrationTest.testFlush() {
        Aest obj = dod.getRandomAest();
        Assert.assertNotNull("Data on demand for 'Aest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Aest' failed to provide an identifier", id);
        obj = Aest.findAest(id);
        Assert.assertNotNull("Find method for 'Aest' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAest(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Aest' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AestIntegrationTest.testMergeUpdate() {
        Aest obj = dod.getRandomAest();
        Assert.assertNotNull("Data on demand for 'Aest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Aest' failed to provide an identifier", id);
        obj = Aest.findAest(id);
        boolean modified =  dod.modifyAest(obj);
        Integer currentVersion = obj.getVersion();
        Aest merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Aest' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AestIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Aest' failed to initialize correctly", dod.getRandomAest());
        Aest obj = dod.getNewTransientAest(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Aest' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Aest' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Aest' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AestIntegrationTest.testRemove() {
        Aest obj = dod.getRandomAest();
        Assert.assertNotNull("Data on demand for 'Aest' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Aest' failed to provide an identifier", id);
        obj = Aest.findAest(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Aest' with identifier '" + id + "'", Aest.findAest(id));
    }
    
}
