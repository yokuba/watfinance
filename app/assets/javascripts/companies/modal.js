$(
  document
).on(
  'turbolinks:load',
  function() {
    // when a company is clicked, show its full content in a modal window
    $(
      'body'
    ).on(
      'click',
      '.single-company-card, .single-company-list',
      function() {
        var company_heading = $(
          this
        )
          .find(
            '.company-content h3'
          )
          .html();
        var company_content = $(
          this
        )
          .find(
            '.company-content p'
          )
          .html();
        var interested = $(
          this
        )
          .find(
            '.company-content .interested'
          )
          .attr(
            'href'
          );
        $(
          '.loaded-data h3'
        ).text(
          company_heading
        );
        $(
          '.loaded-data p'
        ).text(
          company_content
        );
        $(
          '.loaded-data .interested a'
        ).attr(
          'href',
          interested
        );
        $(
          '.myModal'
        ).modal(
          'show'
        );
      }
    );
  }
);
