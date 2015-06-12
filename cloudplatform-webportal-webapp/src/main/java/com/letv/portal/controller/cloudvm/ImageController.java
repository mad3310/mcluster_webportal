package com.letv.portal.controller.cloudvm;

import com.letv.common.result.ResultObject;
import com.letv.common.session.SessionServiceImpl;
import com.letv.portal.service.openstack.exception.RegionNotFoundException;
import com.letv.portal.service.openstack.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/osi")
public class ImageController {

    @Autowired
    private SessionServiceImpl sessionService;

    @RequestMapping(method = RequestMethod.GET)
    public
    @ResponseBody
    ResultObject regions() {
        ResultObject result = new ResultObject();
        result.setData(Util.session(sessionService).getImageManager().getRegions().toArray(new String[0]));
        return result;
    }

    @RequestMapping(value = "/region/{region}", method = RequestMethod.GET)
    public
    @ResponseBody
    ResultObject list(@PathVariable String region) {
        ResultObject result = new ResultObject();
        try {
            result.setData(Util.session(sessionService).getImageManager().list(region));
        } catch (RegionNotFoundException e) {
            result.setResult(0);
            result.addMsg(e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/region/{region}/image/{imageId}", method = RequestMethod.GET)
    public
    @ResponseBody
    ResultObject get(@PathVariable String region, @PathVariable String imageId) {
        ResultObject result = new ResultObject();
        try {
            result.setData(Util.session(sessionService).getImageManager().get(region, imageId));
        } catch (RegionNotFoundException e1) {
            result.setResult(0);
            result.addMsg(e1.getMessage());
        } catch (ResourceNotFoundException e2) {
            result.setResult(0);
            result.addMsg(e2.getMessage());
        }
        return result;
    }
}
