#import "@preview/red-agora:0.1.1": project

#show: project.with(
  title: "二零一财务公开报表",
  subtitle: "Treasurer Report 2021",
  authors: (
    "施俣喆",
  ),
  // mentors: (
  //   "Pr. John Smith (Internal)",
  //   "Jane Doe (External)"
  // ),
  // jury: (
  //   "Pr. John Smith",
  //   "Pr. Jane Doe"
  // ),
  branch: "二零一司库",
  academic-year: datetime.today().display(),
  school-logo: image("stamp.png"),
  footer-text: "二零一司库财务公开文件",
)

= 概览

此报告包含原4人报账时期的最终结算(截至2024-10-25)和拆分后的结算(截至2025-01-22).

4人报账时期账目采用2024-10-16日的核算报表.

拆分后的结算包含2024-10-25 16:00 至 2025-01-22 13:21 的所有记录, 来自Telegram群组 チョウボ 的所有记录.

#let hilight(main) = table.cell(
  fill: green.lighten(60%),
)[#main]
#table(
  columns: 6,
  align: center,
  
  table.cell(colspan: 2)[], table.cell(colspan: 3)[人员], [],
  [Date], [From], [椭脸], [Qx], [楼大王], [Appendix],

  [_N/A_], [25/10/2024], [495.03], [289.92], [273.01], [拆家之前的结算],
  table.cell(colspan: 2)[_N/A_], [56.5], [33.09], [31.16], [拆家补偿款(向下取整)],
  [25/10/2024], [22/01/2025], [944.91], [612.58], [274.31], [拆家之后的结算#footnote("已剔除自2024-12-27 12:14:28至2025-01-14 16:36:03的记录")],
  table.cell(colspan: 2)[], [#hilight(1496.44)], [#hilight(935.59)], [#hilight(578.48)], [总和, 截至2025-01-22 13:21:31],
)



= 财务记录

#let records = json("data/records.json")
#let (id, amount, project, time) = records
#let parse(s) = toml.decode("date = " + s).date
#let table_values = id.values().zip(amount.values(), project.values(), time.values()).map(
  (item) => {
    let (id, amount, project, time) = item

    let date = parse(time).display("[year]-[month]-[day] [hour]:[minute]")

    return ([#date],[#id],[#project],[#amount])
  }
)

#let flatten-table = table_values.flatten()

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if x == 0 or y == 0 { gray },
  inset: (right: 1.5em),
)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]
  } else {
    it
  }
}

#let a = table.cell(
  fill: green.lighten(60%),
)[A]
#let b = table.cell(
  fill: aqua.lighten(60%),
)[B]

== 拆分前记录结算
2024-10-25前的结算记录

#table(
  columns: 4,
  [Date], [From], [Category], [Amount],

  [_N/A_],[椭脸],[],[495.03],
  [_N/A_],[Qx],[],[289.92],
  [_N/A_],[楼大王],[],[273.01],
)

== 拆分后记录
包含 2024-10-25 16:00 至 2025-01-22 13:21 的所有记录。

#table(
  columns: 4,
  [Date], [From], [Category], [Amount],

  ..flatten-table
)

#pagebreak()

= 附录

原始数据报表下载:

#link("")

数据处理程序:


本文档:
