# WEB+DB Press vol.133 で使用したソースコード

本リポジトリでは、[WEB+DB PRESS](https://gihyo.jp/magazine/wdpress) vol.133の「今こそシェルスクリプト」で示したサンプルコードを格納しています。

## 第2章 グループとしてのシェルスクリプト

ShellCheckを実行し、warning等が指摘されている`sum.sh`が以下です。

- [sum.sh](scripts/sum.sh)

本スクリプトに対して[ShellCheck](https://github.com/koalaman/shellcheck) (version 0.9.0)を実行すると、紙面に記載があるような指摘が行われます。

```bash
$ shellcheck scripts/sum.sh

In scripts/sum.sh line 11:
echo $(sum {1..5})
     ^-----------^ SC2046 (warning): Quote this to prevent word splitting.
     ^-----------^ SC2005 (style): Useless echo? Instead of 'echo $(cmd)', just use 'cmd'.

For more information:
  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
  https://www.shellcheck.net/wiki/SC2005 -- Useless echo? Instead of 'echo $(...
```

## 第3章 ツールをつなぐ

### SpotBugs + reviewdog

[SpotBugs](https://spotbugs.github.io/)と[reviewdog](https://github.com/reviewdog/reviewdog)を組み合わせ、SpotBugsのレポートをPull Requestに投稿するスクリプトは以下にあります。

- [spotbugs_report.sh](scripts/spotbugs_report.sh)

また、このシェルスクリプトを組み込んだワークフロー、および、その実行結果は以下から確認が可能です。

- [ワークフロー](.github/workflows/java_static_analysis.yml)
- [静的解析エラーがPull Requestにコメントされた例](https://github.com/kiririmode/webdb133/pull/2)
  - [Checkstyle](https://checkstyle.org/)のエラーも一緒に投稿されています

### GitHub Actions、GitLab CI/CD上でのシェルスクリプト呼び出し

紙面で紹介したワークフローはこちらです。

- [GitHub Actions上でシェルスクリプトを呼び出す](.github/workflows/call_shellscript.yml)
  - [実行結果の例](https://github.com/kiririmode/webdb133/actions/runs/3804548685)
- [GitLab CI/CD上でシェルスクリプトを呼び出す](./.gitlab-ci.yml)
  - [実行結果の例](https://gitlab.com/kiririmode/webdb133/-/jobs/3551370596)

## 第4章 身近な課題を解決する

### 日本語をチェックする

textlintとreviewdogを組み合わせたワークフローは以下に配置しています。

- [ワークフロー](.github/workflows/webdblint.yml)

ここには、紙面の中で作成したヘディングレベル超過チェックのスクリプトも組み込まれています。

### 複数のTerraformモジュールのLint

複数のTerraformモジュールをLintするワークフロー、および、そこで使用したスクリプトは以下に配置しています。

- [ワークフロー](.github/workflows/terraform_validate.yml)
- [スクリプト](scripts/terraform_validate.sh)

また、本ワークフローによる Pull Request コメントの例は以下で参照可能です。

- [実行結果の例](https://github.com/kiririmode/webdb133/pull/1)

### ライセンスの収集

Goで作成したプログラムのライセンス収集のワークフロー、および、そこで使用したスクリプトは以下に配置しています。

- [ワークフロー](.github/workflows/golang_release.yml)
- [スクリプト](scripts/make_credits.sh)

実際に、利用ライブラリのライセンスを表記したサンプルは[Releases](https://github.com/kiririmode/webdb133/releases)よりご確認いただけます。

# お問い合わせ

技術評論社様の[問い合わせフォーム](https://gihyo.jp/site/inquiry/book?ISBN=978-4-297-13370-2)からお願いします
