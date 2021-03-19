import QtQuick 2.0
import Felgo 3.0

Page {

    title: "Treatment"

    AppListView {
        anchors.fill: parent

        // model holds item grouped in sections
        model: [

            {
                section:"GENERAL BODY DETOXIFICATION",
                items:[{text: "- Wuquing Cellular Detox"}, {text:"- G.I"},{text:"- Peptide"}]
            },
            {
                section: "INFERTILITY IN WOMEN",
                items: [{ text: "- Female health Nouripad" }, { text: "- GI" }, { text: "- B- Carotene" }, { text: "- Immune+ capsules" }]
            },
            {
                section: "FIBROIDS",
                items: [{ text: "- Female Nourishing pad" }, { text: "- Immune+" }, { text: "- Anion pantyliner" }, { text: "- B-carotene" }, { text: "- GI" }]
            },

            {
                section: "RHEUMATISM/ARTHRITIS",
                items: [{ text: "- Calcium,iron,zinc" }, { text: "- Oligopeptides" }, { text: "- GI" }]
            },

            {
                section: "EYE DEFECTS",
                items: [{ text: "- Vision vitale" }, { text: "- B-carotene" }, { text: "- GI" }]
            },
            {
                section: "DEMENTIA",
                items: [{ text: "- Peptide" }, { text: "- GI" }, { text: "- B-carotene" }]
            },

            {
                section: "DIABETES",
                items: [{ text: "- Hypoglycemic capsules" }, { text: "- GI" }, { text: "- B carotene" }, { text: "- Peptides(in acute cases)" }]
            },
            {
                section: "PROSTRATE ENLARGEMENT/ CANCER",
                items: [{ text: "- Male Nouripad" }, { text: "- Immune vitale" }, { text: "- Propolis-lecithin-" }, { text: "- Peptides ( cancerous)" }, { text: "- GI" }]
            },
            {
                section: "HYPERTENSION/OTHER HEART DISEASES",
                items: [{ text: "- Peptides" }, { text: "- Kuding tea" }, { text: "- G.I" }, { text: "- Propolis-lecithin-" }]
            },
            {
                section: "INFERTILITY IN MEN/LIBIDO/STIs",
                items: [{ text: "- Gingseng Cordyceps sinensis" }, { text: "- Detox" }, { text: "- Immune capsules" }, { text: "- Peptides and GI(in case of detoxification)" }]
            },
            {
                section: "ASTHMA/BRONCHIAL DISEASES",
                items: [{ text: "- Detox" }, { text: "- GI" }, { text: "- Propolis-lecithin-" }, { text: "- Kuding tea" }, { text: "- Peptide" }]
            },
            {
                section: "ULCERS",
                items: [{ text: "- G.I" }, { text: "- Propolis-lecithin-" }, { text: "- Peptides ( severe cases)" }]
            },
            {
                section: "EPILEPSY",
                items: [{ text: "- Calcium, iron,zinc" }, { text: "- Peptides" }, { text: " - B.carotene" }]
            },
            {
                section: "STROKE",
                items: [{ text: "- Detox" }, { text: "- Natural B-carotene" }, { text: "- Kuding tea" }, { text: "- Peptide" }, { text: "- G.I" }, { text: "- Propolis-lecithin-" }]
            },
            {
                section: "CANCER/CERVICAL",
                items: [{ text: "- Peptide" }, { text: "- G.I" }, { text: "- Immune+" }, { text: "- Nouripad (cervical)" }, { text: "- pantyliner (cervical)" }, { text: "- Anion sanitary pad(cervical)" }]
            },
            {
                section: "HEPATITIS/LIVER DISEASES",
                items: [{ text: "- Hypoglycemic  Herbal capsules" }, { text: "- G.I" }, { text: "- Peptide" }]
            },
            {
                section: "PARKINSON DISEASE",
                items: [{ text: "- Immune+ or immune capsules" }, { text: "- Calcium, iron, zinc capsules" }, { text: "- Peptides" }, { text: "- G.I" }, { text: "- Energy bracelet" }]
            },
            {
                section: "WOUNDS, SKIN BURN, RASH",
                items: [{ text: "- Sunlit herbal toothpaste" }, { text: "- GI" }]
            }
        ]


        // add sections as regular list items
        delegate: Item {
            width: parent.width
            height: contentCol.height

            // each list-entry holds the section header + section items
            Column {
                id: contentCol
                width: parent.width

                // header
                SimpleSection {
                    // manually set otherwise induced section title
                    property string section: modelData.section

                    width: parent.width
                    enabled: true // clickable sections
                    onSelected: {
                        sectionItems.visible = !sectionItems.visible
                    }
                }

                // items
                Column {
                    id: sectionItems
                    width: parent.width

                    // show all items of section with repeater
                    Repeater {
                        model: modelData.items
                        delegate: SimpleRow {
                            text: modelData.text
                        }
                    }
                }

            }
        }
    }

}
