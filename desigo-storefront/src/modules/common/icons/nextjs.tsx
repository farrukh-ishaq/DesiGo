import React from "react"

import { IconProps } from "types/icon"
import Desigo from "@modules/common/icons/desigo"

const NextJs: React.FC<IconProps> = ({
  size = "20",
  ...attributes
}) => {
  return (
    <Desigo
      size={size}
      {...attributes}
    />
  )
}

export default NextJs
