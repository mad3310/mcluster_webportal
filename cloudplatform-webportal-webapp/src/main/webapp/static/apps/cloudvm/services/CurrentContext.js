/**
 * Created by jiangfei on 2015/8/19.
 */
define(['services/app.service','jquery'],function (serviceModule,$) {
  serviceModule.factory('CurrentContext', [
    function () {
      var service = {};

      service.regionId=$('#region_id').val();

      return service;
    }]);
});