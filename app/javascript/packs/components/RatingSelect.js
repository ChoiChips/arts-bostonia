import React from 'react';

const RatingSelect = (props) => {
  let optionElements = props.options.map((option, index) => {
    return (
      <option key={option} value={index + 1}>{option}</option>
    );
  })

  return (
    <label>{props.label}
      <select name={props.name} value={props.selectedOption} onChange={props.handlerFunction}>
        <option value=""></option>
        {optionElements}
      </select>
    </label>
  );
}

export default RatingSelect;
