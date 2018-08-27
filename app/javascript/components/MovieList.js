import React from "react"
import PropTypes from "prop-types"

class MovieList extends React.Component {
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
      <div className="container">
        <div>
          Title: {this.state.title}
        </div>
        <div>
          Text: {this.state.text}
        </div>
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

MovieList.propTypes = {
  greeting: PropTypes.string
};
export default MovieList
