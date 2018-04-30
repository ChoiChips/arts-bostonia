import React from 'react';

const DescriptionText = (props) => {
  return (
    <label>{props.label}
      <textarea
        name={props.name}
        type='text'
        value={props.content}
        onChange={props.handlerFunction}
      />
    </label>
  );
}

export default DescriptionText;
