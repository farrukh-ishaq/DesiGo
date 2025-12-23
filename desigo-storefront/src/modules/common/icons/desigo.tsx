import React from "react"
import { IconProps } from "types/icon"

const DesigoLogo: React.FC<IconProps> = ({
                                           size = "200",
                                           ...attributes
                                         }) => {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 900 300"
      width={size}
      height="auto"
      preserveAspectRatio="xMidYMid meet"
      {...attributes}
    >
      {/* Background */}
      <rect width="900" height="300" fill="#ffffff" />

      {/* Brand Name */}
      <text
        x="450"
        y="130"
        textAnchor="middle"
        fontSize="96"
        fontWeight="800"
        fill="#1F7A3F"
      >
        DESIGO
      </text>

      {/* Tagline */}
      <text
        x="450"
        y="175"
        textAnchor="middle"
        fontSize="26"
        fontWeight="500"
        fill="#333333"
      >
        Indian • Pakistani • Bangladeshi Groceries
      </text>

      {/* Divider */}
      <line
        x1="260"
        y1="200"
        x2="640"
        y2="200"
        stroke="#C9A24D"
        strokeWidth="3"
      />

      {/* HALAL Badge */}
      <rect
        x="380"
        y="215"
        rx="20"
        ry="20"
        width="140"
        height="40"
        fill="#1F7A3F"
      />
      <text
        x="450"
        y="242"
        textAnchor="middle"
        fontSize="22"
        fontWeight="700"
        fill="#ffffff"
      >
        HALAL
      </text>
    </svg>
  )
}

export default DesigoLogo
