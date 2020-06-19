'use strict';

module.exports = {
  async deleteOldBulk(ctx) {
    if (!ctx.query.month) {
      return ctx.badRequest('Missing month parameter');
    } else if (ctx.query.month < 1) {
      return ctx.badRequest('Minimum month parameter is 1');
    } else if ( ctx.query.month > 6) {
      return ctx.badRequest('Maximum month parameter is 6');
    }

    let month = parseInt(ctx.query.month);

    if (isNaN(month) === false) {
      const result = await strapi.connections.default.raw(
        `DELETE FROM materialreports WHERE created_at < (NOW() - INTERVAL ${month} MONTH)`
      );

      return {
        intervalMonth: month,
        deletedRecords: result[0].affectedRows
      };
    } else {
      return ctx.badRequest('Your month parameter is not an integer between 1 and 6');
    }
  }
};
