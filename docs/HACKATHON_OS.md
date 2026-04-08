# Hackathon Operating System

## Goal

このリポジトリでは、BGA Track で受賞することを最上位目標に置く。
単に案を増やすのではなく、`受賞確率が上がる意思決定` を積み上げる。

## Why This Workflow

このトラックは、以下を強く見る。

- 現実の課題であること
- ブロックチェーンを使う必然があること
- 実運用に近いこと
- 社会的インパクトが説明できること

逆に、以下は弱い。

- よくある寄付 dApp の焼き直し
- ウォレット接続を強いる UX
- AI で量産しただけの曖昧な課題設定
- 「オンチェーンにした」以外の価値が薄い案

## Sponsor Read

BGA は Bybit が立ち上げた非営利イニシアチブで、単発スポンサーというより、ハッカソン、インキュベーション、アワード、共同基金まで含むエコシステム運営者として振る舞っている。

判断の前提として、BGA は次を好む。

- デジタル公共財、デジタル信頼、サステナビリティ、金融包摂
- NGO、政府、監査機関、事業者など複数主体が絡む現場
- 監査可能性、失効管理、検証可能な証明、改ざん耐性
- 現実の導入経路を話せるチーム

## Winner Pattern

2025 年の公開情報から見ると、BGA 周辺で評価されたプロジェクトは次の傾向が強い。

- `Genius Tags` / `Plastiks` / `ZenGate`
  SDG Blockchain Accelerator 受賞。共通点は、サステナビリティ、トレーサビリティ、信頼基盤のような「複数主体で検証したい現実データ」を扱っていること。
- `Rumsan`
  人道支援のキャッシュ・バウチャー配布を透明化。寄付ではなく、支援執行の不正防止と監査性に寄っている。
- `eSusFarm`
  小規模農家向けの金融アクセスと保険。弱者支援だが、ユーザーが暗号資産操作をする前提ではない。
- `Token Tails`
  一見コンシューマー寄りでも、継続的な資金流入と実世界の救助成果という測定可能なインパクトを持っている。

勝ち筋として重要なのは次の 4 点。

- 対象ユーザーが具体的
- ブロックチェーンは裏側の信頼層として使う
- 監査、検証、失効、配布履歴などの「多者間整合」に効いている
- 実証導入の話ができる

## Stage Gates

各ステージを通過しない限り、次に進まない。

### Stage 0: Constraint Lock

決めること:

- 締切
- 提出物
- ピッチ時間
- 必須デモ範囲

完了条件:

- `docs/WORKING_STATE.md` の `Constraints` が埋まっている

### Stage 1: Problem Funnel

やること:

- 候補課題を 3-5 件出す
- 既存代替手段と未解決部分を整理する
- 誰が困っているかを具体化する

完了条件:

- `docs/IDEA_SCORECARD.md` に各案が採点されている
- 上位 1-2 件に絞れている

### Stage 2: Evidence Check

やること:

- その課題が本当に存在するかを一次情報または信頼できる記事で確認する
- 被害規模、業務コスト、制度背景、現場フローを調べる

完了条件:

- `docs/WORKING_STATE.md` の `Evidence` と `Sources` が埋まっている
- 「解く価値が弱い」案はここで捨てる

### Stage 3: BGA Fit Review

やること:

- なぜ blockchain かを 1 文で言えるか確認する
- その価値が BGA の審査軸に直接乗るか確認する

完了条件:

- 次の文を自然に言える
  `この案は、複数主体が共有する証跡の検証と改ざん耐性が必要だから blockchain を使う`

### Stage 4: MVP Lock

やること:

- 90 秒で見せるデモフローを固定する
- 成功ケースと失敗ケースを定義する
- オンチェーンとオフチェーンの境界を決める

完了条件:

- `docs/WORKING_STATE.md` の `MVP`, `Demo Flow`, `Architecture` が埋まっている

### Stage 5: Pitch Lock

やること:

- スライド構成
- デモ台本
- 審査員の想定質問

完了条件:

- `docs/PITCH_CHECKLIST.md` が埋まっている

## AI Execution Policy

AI は次の順で動く。

1. `WORKING_STATE.md` を読み、現在ステージを確認する
2. そのステージで必要な情報だけ集める
3. 調査結果をドキュメントへ反映する
4. 次ステージへ進める条件を満たすか判定する
5. 条件を満たさない場合は、案の修正か却下を行う

### Hard Rules

- アイデア数を増やしすぎない
- 記事を読む前にスライドを作らない
- `なぜ blockchain か` が弱ければ案を捨てる
- ウォレット接続前提の UX は避ける
- 個人情報は原則オフチェーン
- デモはネット不調でも通るようにする

## File Protocol

### `docs/WORKING_STATE.md`

現在の意思決定の唯一の正本。今どこまで決まったかを書く。

### `docs/IDEA_SCORECARD.md`

案比較の採点表。感覚ではなく、同じ軸で比較する。

### `docs/PITCH_CHECKLIST.md`

提出物、スライド、デモ、想定 QA のチェック。

## Suggested Next Move

この順で進める。

1. 過去受賞傾向を踏まえた評価軸を固定する
2. 候補課題を 3 件に絞る
3. 1 件ずつ evidence check をする
4. 最終案を 1 件に固定する
5. MVP とピッチ骨子を同時に詰める

## Sources

- BGA top page: https://chainforgood.org/
- BGA forum page: https://chainforgood.org/blockchain-impact-forum
- BGA 2025 awards release: https://www.prnewswire.com/news-releases/blockchain-for-good-alliance-bga-recognized-groundbreaking-blockchain-projects-advancing-the-sdgs-at-2025-forum-302616939.html
- Rumsan Rahat: https://rumsan.com/portfolio/rahat
- eSusFarm overview: https://wearevuka.com/projects/esusfarm/
- Plastiks technology: https://www.plastiks.io/our-technology
- Existing local report: `docs/BGA Track 1（NottsHack）要件調査と領域別の課題分析レポート.md`
