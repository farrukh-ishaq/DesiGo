import { Metadata } from "next"

export const metadata: Metadata = {
  title: "DESIGO | Halal Indian, Pakistani & Bangladeshi Groceries",
  description:
    "DESIGO is your trusted halal grocery store offering Indian, Pakistani, and Bangladeshi products. Fresh, authentic, and halal-certified.",

  keywords: [
    "DESIGO",
    "halal groceries",
    "Indian groceries",
    "Pakistani groceries",
    "Bangladeshi groceries",
    "halal food",
    "South Asian grocery store",
  ],

  authors: [{ name: "DESIGO" }],
  creator: "DESIGO",
  applicationName: "DESIGO",

  metadataBase: new URL("https://desigo.com"), // replace with your production domain

  openGraph: {
    title: "DESIGO | Halal South Asian Groceries",
    description:
      "Shop halal Indian, Pakistani, and Bangladeshi groceries at DESIGO.",
    url: "https://desigo.com",
    siteName: "DESIGO",
    images: [
      {
        url: "/og-image.png", // make sure this file exists in public/
        width: 1200,
        height: 630,
        alt: "DESIGO Halal Groceries",
      },
    ],
    locale: "en_US",
    type: "website",
  },

  twitter: {
    card: "summary_large_image",
    title: "DESIGO | Halal South Asian Groceries",
    description:
      "Fresh halal Indian, Pakistani, and Bangladeshi groceries at DESIGO.",
    images: ["/og-image.png"],
  },

  icons: {
    icon: [
      { url: "/icon.svg", type: "image/svg+xml" }, // your DESIGO logo
      { url: "/favicon.ico" },                      // fallback favicon
    ],
    apple: "/apple-touch-icon.png",                // your 180x180 PNG logo
  },

  themeColor: "#1F7A3F",
}
