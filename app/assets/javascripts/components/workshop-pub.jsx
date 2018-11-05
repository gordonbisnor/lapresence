
window.WorkshopPub = createReactClass({

  getInitialState: function () {
    return {
      published: this.props.published,
      atelierId: this.props.atelierId
    }
  },
  
  togglePublishStatus() {
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
        <button onClick={ this.togglePublishStatus } title="Click to hide from public"  className="glyphicon glyphicon-check text-success unbutton">
        </button>
      );
    } else {
      return (
        <button onClick={ this.togglePublishStatus } title="Click to show to public" className="glyphicon glyphicon-unchecked text-danger unbutton">
        </button>
      );
    }
  },

  render: function() {
    return (<span className="admin-button"> { this.publishButton() } </span>);
  }
})
