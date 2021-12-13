(function ($, Drupal) {
  Drupal.behaviors.corillabase = {
    attach: function (context, settings) {

      /**
       * Funzioni.
       */



      /**
       * JavaScript.
       */

      // Azioni ed eventi. Si associano solo una volta sulla pagina.
      if (context.location) {
        // Document ready.
        $(function () {

          $('.navbar-toggler').on('click', function () {
            $('.navbar-collapse').toggleClass('show');
            $('.navbar-toggler').toggleClass('is-toggled');
          });

        });

      }// Fine azioni da chiamare una sola volta.

      // Da associare anche ad altri caricamenti (es: form in ajax).
      // Document ready.
      $(function () {

      });

    }
  };
})(jQuery, Drupal);

