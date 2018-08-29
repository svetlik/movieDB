import React from "react"
import PropTypes from "prop-types"

class Movie extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: this.props.title,
      text: this.props.text,
      rating: this.props.rating,
      category_name: this.props.category_name
    };
  }

  render () {
    return (
      <React.Fragment>
      <div className="jumbotron">
      <h1>{this.state.title}</h1>
        <div>
          {this.state.text}
        </div>
        <br/>
        <div>
          Rating: {this.state.rating}
        </div>
        <div>
          Category: {this.state.category_name}
        </div>
      </div>
      </React.Fragment>

    );
  }
}

Movie.propTypes = {
  greeting: PropTypes.string
};
export default Movie
