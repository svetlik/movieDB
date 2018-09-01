{/*TODO*/}
import React from "react"
import PropTypes from "prop-types"

class FilterField extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: this.props.title,
      collection: this.props.collection
    };
  }

  render () {
    return (
      <div class="container grid-25 mobile-grid-25">
        <p>{title}</p>

        {/* <% [1, 2, 3, 4, 5].each do |num| %>
          <div><%= link_to num, movies_path(rating: num)%> (<%= "#{Movie.where(rating: num).count}"%>)</div>
        <% end %> */}
      </div>
    );
  }
}

FilterField.propTypes = {
  greeting: PropTypes.string
};
export default FilterField
