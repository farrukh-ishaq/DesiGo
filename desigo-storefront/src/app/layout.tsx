import { getBaseURL } from "@lib/util/env"
import { metadata as baseMetadata } from "./metadata"
import "styles/globals.css"

export const metadata = {
  ...baseMetadata,
  metadataBase: new URL(getBaseURL()),
}

export default function RootLayout(props: { children: React.ReactNode }) {
  return (
    <html lang="en" data-mode="light">
    <body>
    <main className="relative">{props.children}</main>
    </body>
    </html>
  )
}
