package com.letv.portal.controller.cloudvm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.letv.common.result.ResultObject;
import com.letv.common.session.SessionServiceImpl;
import com.letv.portal.service.openstack.exception.OpenStackException;

@Controller
@RequestMapping("/osi")
public class ImageController {

    @Autowired
    private SessionServiceImpl sessionService;

    @RequestMapping(value="/regions",method = RequestMethod.GET)
    public
    @ResponseBody
    ResultObject regions() {
        ResultObject result = new ResultObject();
        try {
        result.setData(Util.session(sessionService).getImageManager().getRegions().toArray(new String[0]));
        } catch (OpenStackException e) {
			throw e.matrixException();
		}
        return result;
    }

    @RequestMapping(value = "/region/{region}", method = RequestMethod.GET)
    public
    @ResponseBody
    ResultObject list(@PathVariable String region) {
        ResultObject result = new ResultObject();
        try {
            result.setData(Util.session(sessionService).getImageManager().list(region));
        } catch (OpenStackException e) {
        	throw e.matrixException();
        }
        return result;
    }
    
    @RequestMapping(value = "/region/{region}/group", method = RequestMethod.GET)
    public
    @ResponseBody
    ResultObject group(@PathVariable String region) {
        ResultObject result = new ResultObject();
        try {
            result.setData(Util.session(sessionService).getImageManager().group(region));
        } catch (OpenStackException e) {
        	throw e.matrixException();
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
        } catch (OpenStackException e) {
        	throw e.matrixException();
        }
        return result;
    }
}
