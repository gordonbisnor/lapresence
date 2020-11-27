
window.WorkshopPub = createReactClass({

  getInitialState: function () {
    return {
      published: this.props.published,
      atelierId: this.props.atelierId
    }
  },
  
  togglePublishStatus(event) {
    event.preventDefault();
    let state = !this.state.published;
    let url = '/admin/ateliers/' + this.state.atelierId + ".js";
    let _this = this;
    $.ajax({
      type: "PUT",
      url: url,
      data: {atelier: {published: state}},
      success: function(){ _this.setState({published: state}); }
    });
  },
    

  publishButton () {

    if (this.state.published) {
      return (
        <button onClick={ this.togglePublishStatus } title="Click to hide from public"  className="text-success unbutton"><i className="fa fa-check-circle"></i> Published
        </button>
      );
    } else {
      return (
        <button onClick={ this.togglePublishStatus } title="Click to show to public" className="text-danger unbutton sans"><i className="far fa-circle"></i> Not Published
        </button>
      );
    }
  },

  render: function() {
    return (<span className="f2 publish-button pr1">{ this.publishButton() }</span>);
  }
})
