import React from 'react';

const RatingSelect = (props) => {
  let optionElements = props.options.map((option, index) => {
    return (
      <option key={option} value={index + 1}>{option}</option>
    );
  })

  return (
    <div className="field">
      <label className="label">
        {props.label}
      </label>
      <select name={props.name} value={props.selectedOption} onChange={props.handlerFunction}>
        <option value=""></option>
        {optionElements}
      </select>
    </div>
  );
}

export default RatingSelect;
