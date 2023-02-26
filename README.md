# チーム開発：Nagano-cake

## 🚩 目次

- [紹介](#紹介)
- [作成時のルール](#作成時のルール)
- [結果物：ER図など含](#結果物)
- [難しかったところ](#難しかったところ)
- [学んだこと](#学んだこと)
- [参考文献](#参考文献)

## 紹介

- DMMにてチーム開発課題「ECサイト：Nagano-cake」を行いました。<br>
ER図の作成から行いました。
- [チーム、作成物の紹介スライド](https://docs.google.com/presentation/d/1ZPusz4YaSrimYWSZDYcAxqzZCVyDQVnLw3rgXgp5fb0/edit#slide=id.g211190fd456_0_101)

- チーム目標：`楽しく！協力して！４人のベストなものを作成する！`

## 結果物

- [ER図（Draw.ioで作成）](https://app.diagrams.net/?client=1#G1rpEe8vc7hq91PfbT3TRWwWE8obDGbZyV)
- [詳細設計書](https://docs.google.com/spreadsheets/d/1gsZNOhCAms5uHpuH0sX3FnBJw3qYLgpZ/edit#gid=1244685342)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1yg-x-vVqdN6I-QiFRSNLq8y5U7XCB8jPnunMfyuC38E/edit#gid=1373217982)

- [チームgit学習のまとめ](/readme/git.md)

## 作成時のルール

### ブランチに関して

- `main: リリース用　/ develop: 統合用 / developから各自派生ブランチ`
- 大文字は使用しない
  - [git style guide参照]((<https://github.com/objectx/git-style-guide#%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81>))
- ブランチ名は「`カテゴリ名/名前/~~`」としました。<br>
[カテゴリ表]

| 名前 | 用途 | 補足 |
| --- | --- | --- |
| feature | 機能の追加、リファクタリング |  |
| bugfix | バグ修正 |  |
| hotfix | 緊急の修正を行う | リリースした後、緊急のバグへの対応の際に使用されることが多い。 |
| test | テスト用 |  |

## 難しかったところ

- enumの設定方法(ymlファイルと日本語設定)
- deviseを用いた退会機能の実装方法
  - [退会機能参考サイト①](https://qiita.com/bty__/items/358d0a425193b12c969a)
  - [退会機能参考サイト②](https://qiita.com/__Wata16__/items/9e05596afb671e540365)
- 中間テーブルを理解しての作成(ER図含め).
- 詳細設計書にてURLの作成.<br>
今までresoursesなどを使用して作成していたため、１から考えることが難しく<br>
どのようにして作成されるのか(ネストの際の違いも含め)学習した.

## 学んだこと

**チームでのGitの使用方法**

- ブランチ命名規則や使用方法、コンフリクトについて、rebase、mergeでのコンフリクト修正方法など
- [**Git学習のまとめもこちらに作成しましたので、ご覧ください！**](/readme/git.md)

## 参考文献

- [`MDN Web Docs`](https://developer.mozilla.org/ja/docs/Web/JavaScript)
- [`Rails ガイド`](https://railsguides.jp/active_record_validations.html)
- [git style guide]((<https://github.com/objectx/git-style-guide#%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81>))
