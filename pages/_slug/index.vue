<template>
  <main class="main">
    <h1 class="title">{{ title }}</h1>
    <p class="publishedAt">{{ publishedAt }}</p>
    <div class="post" v-html="body"></div>
  </main>
</template>

<script>
import axios from 'axios'

export default {
  async asyncData({ params, $config }) {
    const { data } = await axios.get(
      `${$config.microCmsApiBaseUrl}/api/v1/blog/${params.slug}`,
      {
        headers: { 'X-MICROCMS-API-KEY': $config.microCmsApiKey }
      }
    )
    return data
  }
}
</script>

<style lang="scss" scoped>
.main {
  width: 960px;
  /* 上下 | 左右 */
  margin: 0 auto;
}

.title {
  margin-bottom: 20px;
}

.publishedAt {
  /* 下 */
  margin-bottom: 40px;
}

.post ::v-deep {
  & > h1 {
    font-size: 30px;
    font-weight: bold;

    /* 上 | 左右 | 下 */
    margin: 40px 0 20px;
    background-color: #eee;
    padding: 10px 20px;
    border-radius: 5px;
  }

  & > h2 {
    font-size: 24px;
    font-weight: bold;

    /* 上 | 左右 | 下 */
    margin: 40px 0 16px;

    /* 下の境目のやつ */
    border-bottom: 1px solid #ddd;
  }

  & > p {
    line-height: 1.8;

    /* 水平方向の字間のスペース */
    letter-spacing: 0.2px;
  }

  & > ol {
    /* リスト項目要素のマーカーを設定 */
    list-style-type: decimal;

    /* ::marker疑似要素の位置 */
    list-style-position: inside;
  }


}
</style>
