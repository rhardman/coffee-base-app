// Generated by CoffeeScript 1.3.3
(function() {
  var Logger, MixlibLog, Singleton, winston,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Singleton = require('./singleton');

  winston = require('winston');

  MixlibLog = require('winston-mixlib-log').MixlibLog;

  /**
   * Logging class that acts as a singleton.
  */


  Logger = (function(_super) {

    __extends(Logger, _super);

    /**
     * At some point we're going to want to allow appenders here.
    */


    function Logger() {
      this.logger = new winston.Logger({
        transports: [
          new MixlibLog({
            timestamp: true
          })
        ]
      });
      this.logger.log = function() {
        var args;
        args = arguments;
        return winston.Logger.prototype.log.apply(this, args);
      };
      return this.logger;
    }

    return Logger;

  })(Singleton);

  module.exports = Logger;

}).call(this);
